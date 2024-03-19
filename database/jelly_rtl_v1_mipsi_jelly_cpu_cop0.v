// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



module jelly_cpu_cop0
    #(
        parameter                   DBBP_NUM = 4        // hardware breakpoints num
    )
    (
        input   wire                clk,
        input   wire                reset,

        input   wire                interlock,
        
        input   wire                in_en,
        input   wire    [4:0]       in_addr,
        input   wire    [2:0]       in_sel,
        input   wire    [31:0]      in_data,
        
        output  reg     [31:0]      out_data,
        
        input   wire                exception,
        input   wire                rfe,
        input   wire                dbg_break,
        
        input   wire    [31:0]      in_cause,
        input   wire    [31:0]      in_epc,
        input   wire    [31:0]      in_debug,
        input   wire    [31:0]      in_depc,
        
        output  wire    [31:0]      out_status,
        output  wire    [31:0]      out_cause,
        output  wire    [31:0]      out_epc,
        output  wire    [31:0]      out_debug,
        output  wire    [31:0]      out_depc,
        
        output  wire    [31:0]      out_debp0,
        output  wire    [31:0]      out_debp1,
        output  wire    [31:0]      out_debp2,
        output  wire    [31:0]      out_debp3
    );
    
    // register
    reg     [31:0]  reg_status;     // 12
    reg     [31:0]  reg_cause;      // 13
    reg     [31:0]  reg_epc;        // 14
    reg     [31:0]  reg_debug;      // 23
    reg     [31:0]  reg_depc;       // 24
    
    reg     [31:0]  reg_debp0;      // 16
    reg     [31:0]  reg_debp1;      // 17
    reg     [31:0]  reg_debp2;      // 18
    reg     [31:0]  reg_debp3;      // 19
    
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_status <= {32{1'b0}};
            reg_cause  <= {32{1'b0}};
            reg_epc    <= {32{1'b0}};
            reg_debug  <= {32{1'b0}};
            reg_depc   <= {32{1'b0}};
            reg_debp0  <= {32{1'b0}};
            reg_debp1  <= {32{1'b0}};
            reg_debp2  <= {32{1'b0}};
            reg_debp3  <= {32{1'b0}};
        end
        else begin
            if ( !interlock ) begin
                // status (12)
                if ( exception ) begin
                    reg_status[0] <= 1'b0;
                    reg_status[2] <= reg_status[0];
                    reg_status[4] <= reg_status[2];
                end
                else if ( rfe ) begin
                    reg_status[0] <= reg_status[2];
                    reg_status[2] <= reg_status[4];
                end
                else if ( in_en & (in_addr == 5'd12) ) begin
                    reg_status[0] <= in_data[0];
                    reg_status[2] <= in_data[2]; 
                    reg_status[4] <= in_data[4];
                end

                // cause (13)
                if ( exception ) begin
                    reg_cause[31]  <= in_cause[31];     // BD
                    reg_cause[6:2] <= in_cause[6:2];    // ExcCode
                end
                else if ( in_en & (in_addr == 5'd13) ) begin
                    reg_cause[31]  <= in_data[31];      // BD
                    reg_cause[6:2] <= in_data[6:2];     // ExcCode
                end
                
                // epc (14)
                if ( exception ) begin
                    reg_epc[31:2] <= in_epc[31:2];
                end
                else if ( in_en & (in_addr == 5'd14) ) begin
                    reg_epc[31:2] <= in_data[31:2];
                end
                
                // debug (23)
                if ( dbg_break ) begin
                    reg_debug[31] <= in_debug[31];
                end
                else if ( in_en & (in_addr == 5'd23) ) begin
                    reg_debug[31] <= in_data[31];                   // BD
                    reg_debug[24] <= in_data[24];                   // Step Break
                    reg_debug[3]  <= in_data[0] & (DBBP_NUM >= 4);  // BP3 enable bit
                    reg_debug[2]  <= in_data[0] & (DBBP_NUM >= 3);  // BP2 enable bit
                    reg_debug[1]  <= in_data[0] & (DBBP_NUM >= 2);  // BP1 enable bit
                    reg_debug[0]  <= in_data[0] & (DBBP_NUM >= 1);  // BP0 enable bit
                end
                
                // deepc (24)
                if ( dbg_break ) begin
                    reg_depc[31:2] <= in_depc[31:2];
                end
                else if ( in_en & (in_addr == 5'd24) ) begin
                    reg_depc[31:2] <= in_data[31:2];
                end
                
                // debp
                if ( in_en & (in_addr == 5'd16) & (DBBP_NUM >= 1) ) begin
                    reg_debp0[31:2] <= in_data[31:2];
                end
                if ( in_en & (in_addr == 5'd17) & (DBBP_NUM >= 2) ) begin
                    reg_debp1[31:2] <= in_data[31:2];
                end
                if ( in_en & (in_addr == 5'd18) & (DBBP_NUM >= 3) ) begin
                    reg_debp2[31:2] <= in_data[31:2];
                end
                if ( in_en & (in_addr == 5'd19) & (DBBP_NUM >= 4) ) begin
                    reg_debp3[31:2] <= in_data[31:2];
                end
            end
        end
    end
    
    // output
    always @* begin
        case ( in_addr )
        5'd12:      out_data <= reg_status;
        5'd13:      out_data <= reg_cause;
        5'd14:      out_data <= reg_epc;
        5'd23:      out_data <= reg_debug;
        5'd24:      out_data <= reg_depc;
        5'd16:      out_data <= reg_debp0;
        5'd17:      out_data <= reg_debp1;
        5'd18:      out_data <= reg_debp2;
        5'd19:      out_data <= reg_debp3;
        default:    out_data <= {32{1'b0}};
        endcase
    end
    
    assign out_status = reg_status;
    assign out_cause  = reg_cause;
    assign out_epc    = reg_epc;
    assign out_debug  = reg_debug;
    assign out_depc   = reg_depc;

    assign out_debp0  = reg_debp0;
    assign out_debp1  = reg_debp1;
    assign out_debp2  = reg_debp2;
    assign out_debp3  = reg_debp3;
    
endmodule



`default_nettype wire



// end of file
