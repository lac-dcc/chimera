// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 13:02:01
// Design Name: 
// Module Name: input_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module input_module#(
    parameter BLOCK_LENGTH = 576,
    parameter D_WIDTH = 64
    )(
    input                               clk,
    input                               reset,
    input   [D_WIDTH-1:0]               data_in,
    input   [3:0]                       add,
    input   [6:0]                       control,
    output  [BLOCK_LENGTH-1:0]          P
    );
    
    reg [63:0] P_reg [0:8];
    
    assign P = {P_reg[8],P_reg[7],P_reg[6],P_reg[5],P_reg[4],P_reg[3],P_reg[2],P_reg[1],P_reg[0]};
    
    reg [D_WIDTH - 1:0] m;
    
    wire rst;
    wire load_padding;
    wire start_padding;
    wire load;
    wire start;
    wire read;
    wire start_padding_double;
    
    assign rst                  = ~control[0] && reset;
    assign load_padding         = control[1];
    assign start_padding        = control[2];
    assign load                 = control[3];
    assign start                = control[4];
    assign read                 = control[5];
    assign start_padding_double = control[6];
    
    reg [D_WIDTH - 1:0] d_in;
    reg                 first_pad;
    reg                 double_pad;
    wire [D_WIDTH - 1:0] m_d;
    
    assign m_d = m >> 6;
    
    always @* begin
        if(!rst) begin
            d_in        = 0;
            //first_pad   = 0;
            //double_pad  = 0;
        end
        else begin
            /*
            if(start_padding_double)    double_pad = 1;
            else                        double_pad = double_pad;
            
            if(start_padding)           first_pad = 1;
            else                        first_pad = first_pad;
            */
            
            if      (double_pad & !first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 4'b1000)  d_in = data_in + (3'b110 << m[5:0]); // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 4'b1000)  d_in = data_in + (2'b10 << m[5:0]); // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 4'b1000)  d_in = data_in + (1'b0 << m[5:0]); // 63 (bit-aligned)  
                else                                             d_in = data_in; 
            end
            else if (double_pad & first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 0)  d_in = data_in; // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 0)  d_in = 1'b1; // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 0)  d_in = 2'b11; // 63 (bit-aligned)  
                else if (add == 4'b1000)                   d_in = {1'b1,data_in[62:0]};
                else                                       d_in = data_in;
            end
            else if (!double_pad & first_pad) begin
                if(m[5:0] ==  6'b111110) // 62 (bit-aligned)
                    if ((add == 4'b1000) & ((m_d + 1) == 4'b1000) & first_pad)      d_in = {1'b1,{62{1'b0}},1'b1}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (2'b10 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 1'b1;
                    else if (add == 4'b1000 & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111111) // 63 (bit-aligned)
                    if ((add == 4'b1000) & ((m_d + 1) == 4'b1000) & first_pad)      d_in = {1'b1,{61{1'b0}},2'b11}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (1'b0 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 2'b11;
                    else if (add == 4'b1000 & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else begin //
                    if ((add == 4'b1000) & (m_d == 4'b1000) & first_pad)    d_in = {1'b1,data_in[62:0]} + (3'b110 << m[5:0]); // Padding in the same line
                    else if ((add == m_d) & first_pad)                      d_in = data_in + (3'b110 << m[5:0]);
                    else if (add == 4'b1000 & first_pad)                    d_in = {1'b1,data_in[62:0]};
                    else                                                    d_in = data_in;
                end
            end
            else d_in = data_in;
         end 
      end
    
    always @(posedge clk) begin
        if(!rst) begin
            P_reg[0]    <= 0;
            P_reg[1]    <= 0;
            P_reg[2]    <= 0;
            P_reg[3]    <= 0;
            P_reg[4]    <= 0;
            P_reg[5]    <= 0;
            P_reg[6]    <= 0;
            P_reg[7]    <= 0;
            P_reg[8]    <= 0;
            m           <= 0;
            double_pad  <= 0;
            first_pad   <= 0;
        end
        else begin
            if(load_padding)    m <= data_in;
            else                m <= m; 
            
            if(load) P_reg[add] <= d_in;
            else     P_reg[add] <= P_reg[add];   
            
            if(start_padding_double)    double_pad <= 1;
            else                        double_pad <= double_pad;
            
            if(start_padding)           first_pad <= 1;
            else                        first_pad <= first_pad;
            
        end
    end
    
endmodule

module input_module_GEN#(
    parameter BLOCK_LENGTH = 576,
    parameter ADDRESS  = BLOCK_LENGTH / 64,
    parameter D_WIDTH = 64
    )(
    input                               clk,
    input                               reset,
    input   [D_WIDTH-1:0]               data_in,
    input   [4:0]                       add,
    input   [7:0]                       control,
    output  [BLOCK_LENGTH-1:0]          P
    );
    
    reg [63:0] P_reg [0:(ADDRESS-1)];
    
    wire [4:0] add_sel;
    
    genvar i;
    generate
        for(i = 0; i < ADDRESS; i = i + 1) begin
        assign P[((i+1)*64 - 1):(i*64)] = P_reg[i];
        end
        
        if      (BLOCK_LENGTH == 576)   assign add_sel = 5'b01000;
        else if (BLOCK_LENGTH == 832)   assign add_sel = 5'b01100;
        else if (BLOCK_LENGTH == 1088)  assign add_sel = 5'b10000;
        else if (BLOCK_LENGTH == 1152)  assign add_sel = 5'b10001;
        else                            assign add_sel = 5'b01000;                   
    endgenerate
    
    reg [D_WIDTH - 1:0] m;
    
    wire rst;
    wire load_padding;
    wire start_padding;
    wire load;
    wire start;
    wire read;
    wire start_padding_double;
    wire start_shake;
    
    assign rst                  = ~control[0] && reset;
    assign load_padding         = control[1];
    assign start_padding        = control[2];
    assign load                 = control[3];
    assign start                = control[4];
    assign read                 = control[5];
    assign start_padding_double = control[6];
    assign start_shake          = control[7];
    
    reg [D_WIDTH - 1:0] d_in;
    reg                 first_pad;
    reg                 double_pad;
    wire [D_WIDTH - 1:0] m_d;
    
    assign m_d = m >> 6;
    
    always @* begin
        if(!rst) begin
            d_in        = 0;
            /*
            first_pad   = 0;
            double_pad  = 0;
            */
        end
        else begin
            /*
            if(start_padding_double)    double_pad = 1;
            else                        double_pad = double_pad;
            
            if(start_padding)           first_pad = 1;
            else                        first_pad = first_pad;
            */
            
            if      (double_pad & !first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == add_sel)  d_in = data_in + (3'b110 << m[5:0]); // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == add_sel)  d_in = data_in + (2'b10 << m[5:0]); // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == add_sel)  d_in = data_in + (1'b0 << m[5:0]); // 63 (bit-aligned)  
                else                                             d_in = data_in; 
            end
            else if (double_pad & first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 0)  d_in = data_in; // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 0)  d_in = 1'b1;    // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 0)  d_in = 2'b11; // 63 (bit-aligned)  
                else if (add == add_sel)                   d_in = {1'b1,data_in[62:0]};
                else                                       d_in = data_in;
            end
            else if (!double_pad & first_pad) begin
                if(m[5:0] ==  6'b111110) // 62 (bit-aligned)
                    if ((add == add_sel) & ((m_d + 1) == add_sel) & first_pad)      d_in = {1'b1,{62{1'b0}},1'b1}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (2'b10 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 1'b1;
                    else if (add == add_sel & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111111) // 63 (bit-aligned)
                    if ((add == add_sel) & ((m_d + 1) == add_sel) & first_pad)      d_in = {1'b1,{61{1'b0}},2'b11}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (1'b0 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 2'b11;
                    else if (add == add_sel & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else begin //
                    if ((add == add_sel) & (m_d == add_sel) & first_pad)    d_in = {1'b1,data_in[62:0]} + (3'b110 << m[5:0]); // Padding in the same line
                    else if ((add == m_d) & first_pad)                      d_in = data_in + (3'b110 << m[5:0]);
                    else if (add == add_sel & first_pad)                    d_in = {1'b1,data_in[62:0]};
                    else                                                    d_in = data_in;
                end
            end
            else d_in = data_in;
         end 
      end
        
    generate
        if(BLOCK_LENGTH == 576) begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
        
        else if(BLOCK_LENGTH == 832) begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    P_reg[9]    <= 0;
                    P_reg[10]    <= 0;
                    P_reg[11]    <= 0;
                    P_reg[12]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
        
        else if(BLOCK_LENGTH == 1088) begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    P_reg[9]    <= 0;
                    P_reg[10]    <= 0;
                    P_reg[11]    <= 0;
                    P_reg[12]    <= 0;
                    P_reg[13]    <= 0;
                    P_reg[14]    <= 0;
                    P_reg[15]    <= 0;
                    P_reg[16]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
        
         else if(BLOCK_LENGTH == 1152) begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    P_reg[9]    <= 0;
                    P_reg[10]    <= 0;
                    P_reg[11]    <= 0;
                    P_reg[12]    <= 0;
                    P_reg[13]    <= 0;
                    P_reg[14]    <= 0;
                    P_reg[15]    <= 0;
                    P_reg[16]    <= 0;
                    P_reg[17]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
        
        else begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
    endgenerate
   
    
endmodule

module input_module_GEN_SHAKE#(
    parameter BLOCK_LENGTH = 576,
    parameter ADDRESS  = BLOCK_LENGTH / 64,
    parameter D_WIDTH = 64
    )(
    input                               clk,
    input                               reset,
    input   [D_WIDTH-1:0]               data_in,
    input   [4:0]                       add,
    input   [7:0]                       control,
    output  [BLOCK_LENGTH-1:0]          P
    );
    
    reg [63:0] P_reg [0:(ADDRESS-1)];
    
    wire [4:0] add_sel;
    
    genvar i;
    generate
        for(i = 0; i < ADDRESS; i = i + 1) begin
        assign P[((i+1)*64 - 1):(i*64)] = P_reg[i];
        end
        
        if      (BLOCK_LENGTH == 1088)  assign add_sel = 5'b10000;
        else if (BLOCK_LENGTH == 1344)  assign add_sel = 5'b10100;
        else                            assign add_sel = 5'b10000;                   
    endgenerate
    
    reg [D_WIDTH - 1:0] m;
    
    wire rst;
    wire load_padding;
    wire start_padding;
    wire load;
    wire start;
    wire read;
    wire start_padding_double;
    wire start_shake;
    
    assign rst                  = ~control[0] && reset;
    assign load_padding         = control[1];
    assign start_padding        = control[2];
    assign load                 = control[3];
    assign start                = control[4];
    assign read                 = control[5];
    assign start_padding_double = control[6];
    assign start_shake          = control[7];
    
    reg [D_WIDTH - 1:0] d_in;
    reg                 first_pad;
    reg                 double_pad;
    wire [D_WIDTH - 1:0] m_d;
    
    assign m_d = m >> 6;
    
    /*
    always @* begin
        if(!rst) d_in       = 0;
        else     d_in       = data_in;
    end
    */
    
    always @* begin
        if(!rst) begin
            d_in        = 0;
            
            // first_pad   = 0;
            // double_pad  = 0;
            
        end
        else begin
            
            // if(start_padding_double)    double_pad = 1;
            // else                        double_pad = double_pad;
            
            // if(start_padding)           first_pad = 1;
            // else                        first_pad = first_pad;
            
            
            if      (double_pad & !first_pad) begin
                if      (m[5:0] ==  6'b111011 & add == add_sel)  d_in = data_in + (5'b11111 << m[5:0]); // 59 (bit-aligned)
                else if (m[5:0] ==  6'b111100 & add == add_sel)  d_in = data_in + (4'b1111 << m[5:0]); // 60 (bit-aligned)
                else if (m[5:0] ==  6'b111101 & add == add_sel)  d_in = data_in + (3'b111 << m[5:0]); // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == add_sel)  d_in = data_in + (2'b11 << m[5:0]); // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == add_sel)  d_in = data_in + (1'b1 << m[5:0]); // 63 (bit-aligned)  
                else                                             d_in = data_in; 
            end
            else if (double_pad & first_pad) begin
                if      (m[5:0] ==  6'b111011 & add == 0)  d_in = data_in;      // 59 (bit-aligned)
                else if (m[5:0] ==  6'b111100 & add == 0)  d_in = 1'b1;         // 60 (bit-aligned)
                else if (m[5:0] ==  6'b111101 & add == 0)  d_in = 2'b11;        // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 0)  d_in = 3'b111;       // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 0)  d_in = 4'b1111;      // 63 (bit-aligned)  
                else if (add == add_sel)                   d_in = {1'b1,data_in[62:0]};
                else                                       d_in = data_in;
            end
            else if (!double_pad & first_pad) begin
                if(m[5:0] == 6'b111100)     // 60 (bit-aligned)
                    if ((add == add_sel) & ((m_d + 1) == add_sel) & first_pad)      d_in = {1'b1,{61{1'b0}},1'b1}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (4'b1111 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 1'b1;
                    else if (add == add_sel & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111101) // 61 (bit-aligned)
                    if ((add == add_sel) & ((m_d + 1) == add_sel) & first_pad)      d_in = {1'b1,{61{1'b0}},2'b11}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (3'b111 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 2'b11;
                    else if (add == add_sel & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111110) // 62 (bit-aligned)
                    if ((add == add_sel) & ((m_d + 1) == add_sel) & first_pad)      d_in = {1'b1,{61{1'b0}},3'b111}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (2'b11 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 3'b111;
                    else if (add == add_sel & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111111) // 63 (bit-aligned)
                    if ((add == add_sel) & ((m_d + 1) == add_sel) & first_pad)      d_in = {1'b1,{61{1'b0}},4'b1111}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (1'b1 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 4'b1111;
                    else if (add == add_sel & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else begin //
                    if ((add == add_sel) & (m_d == add_sel) & first_pad)    d_in = {1'b1,data_in[62:0]} + (5'b11111 << m[5:0]); // Padding in the same line
                    else if ((add == m_d) & first_pad)                      d_in = data_in + (5'b11111 << m[5:0]);
                    else if (add == add_sel & first_pad)                    d_in = {1'b1,data_in[62:0]};
                    else                                                    d_in = data_in;
                end
            end
            else d_in = data_in;
         end 
      end
      
        
    generate
        if(BLOCK_LENGTH == 1088) begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    P_reg[9]    <= 0;
                    P_reg[10]    <= 0;
                    P_reg[11]    <= 0;
                    P_reg[12]    <= 0;
                    P_reg[13]    <= 0;
                    P_reg[14]    <= 0;
                    P_reg[15]    <= 0;
                    P_reg[16]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
        
         else if(BLOCK_LENGTH == 1344) begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    P_reg[9]    <= 0;
                    P_reg[10]    <= 0;
                    P_reg[11]    <= 0;
                    P_reg[12]    <= 0;
                    P_reg[13]    <= 0;
                    P_reg[14]    <= 0;
                    P_reg[15]    <= 0;
                    P_reg[16]    <= 0;
                    P_reg[17]    <= 0;
                    P_reg[18]    <= 0;
                    P_reg[19]    <= 0;
                    P_reg[20]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
        
        else begin
            always @(posedge clk) begin
                if(!rst) begin
                    P_reg[0]    <= 0;
                    P_reg[1]    <= 0;
                    P_reg[2]    <= 0;
                    P_reg[3]    <= 0;
                    P_reg[4]    <= 0;
                    P_reg[5]    <= 0;
                    P_reg[6]    <= 0;
                    P_reg[7]    <= 0;
                    P_reg[8]    <= 0;
                    m           <= 0;
                    double_pad  <= 0;
                    first_pad   <= 0;
                end
                else begin
                        if(load_padding)    m <= data_in;
                        else                m <= m; 
                        
                        if(load) P_reg[add] <= d_in;
                        else     P_reg[add] <= P_reg[add]; 
                        
                        if(start_padding_double)    double_pad <= 1;
                        else                        double_pad <= double_pad;
            
                        if(start_padding)           first_pad <= 1;
                        else                        first_pad <= first_pad;
                    
                end
            end
        end
    endgenerate
   
    
endmodule

module input_module_832#(
    parameter BLOCK_LENGTH = 832,
    parameter D_WIDTH = 64
    )(
    input                               clk,
    input                               reset,
    input   [D_WIDTH-1:0]               data_in,
    input   [3:0]                       add,
    input   [6:0]                       control,
    output  [BLOCK_LENGTH-1:0]          P
    );
    
    reg [63:0] P_reg [0:12];
    
    assign P = {P_reg[12], P_reg[11], P_reg[10], P_reg[9], P_reg[8],P_reg[7],P_reg[6],P_reg[5],P_reg[4],P_reg[3],P_reg[2],P_reg[1],P_reg[0]};
    
    reg [D_WIDTH - 1:0] m;
    
    wire rst;
    wire load_padding;
    wire start_padding;
    wire load;
    wire start;
    wire read;
    wire start_padding_double;
    
    assign rst                  = ~control[0] && reset;
    assign load_padding         = control[1];
    assign start_padding        = control[2];
    assign load                 = control[3];
    assign start                = control[4];
    assign read                 = control[5];
    assign start_padding_double = control[6];
    
    reg [D_WIDTH - 1:0] d_in;
    reg                 first_pad;
    reg                 double_pad;
    wire [D_WIDTH - 1:0] m_d;
    
    assign m_d = m >> 6;
    
    always @* begin
        if(!rst) begin
            d_in        = 0;
            first_pad   = 0;
            double_pad  = 0;
        end
        else begin
            if(start_padding_double)    double_pad = 1;
            else                        double_pad = double_pad;
            
            if(start_padding)           first_pad = 1;
            else                        first_pad = first_pad;
            
            if      (double_pad & !first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 4'b1100)  d_in = data_in + (3'b110 << m[5:0]); // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 4'b1100)  d_in = data_in + (2'b10 << m[5:0]); // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 4'b1100)  d_in = data_in + (1'b0 << m[5:0]); // 63 (bit-aligned)  
                else                                             d_in = data_in; 
            end
            else if (double_pad & first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 0)  d_in = data_in; // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 0)  d_in = 1'b1; // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 0)  d_in = 2'b11; // 63 (bit-aligned)  
                else if (add == 4'b1100)                   d_in = {1'b1,data_in[62:0]};
                else                                       d_in = data_in;
            end
            else if (!double_pad & first_pad) begin
                if(m[5:0] ==  6'b111110) // 62 (bit-aligned)
                    if ((add == 4'b1100) & ((m_d + 1) == 4'b1100) & first_pad)      d_in = {1'b1,{62{1'b0}},1'b1}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (2'b10 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 1'b1;
                    else if (add == 4'b1100 & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111111) // 63 (bit-aligned)
                    if ((add == 4'b1100) & ((m_d + 1) == 4'b1100) & first_pad)      d_in = {1'b1,{61{1'b0}},2'b11}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (1'b0 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 2'b11;
                    else if (add == 4'b1100 & first_pad)                            d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else begin //
                    if ((add == 4'b1100) & (m_d == 4'b1100) & first_pad)    d_in = {1'b1,data_in[62:0]} + (3'b110 << m[5:0]); // Padding in the same line
                    else if ((add == m_d) & first_pad)                      d_in = data_in + (3'b110 << m[5:0]);
                    else if (add == 4'b1100 & first_pad)                    d_in = {1'b1,data_in[62:0]};
                    else                                                    d_in = data_in;
                end
            end
            else d_in = data_in;
         end 
      end
    
    always @(posedge clk) begin
        if(!rst) begin
            P_reg[0]    <= 0;
            P_reg[1]    <= 0;
            P_reg[2]    <= 0;
            P_reg[3]    <= 0;
            P_reg[4]    <= 0;
            P_reg[5]    <= 0;
            P_reg[6]    <= 0;
            P_reg[7]    <= 0;
            P_reg[8]    <= 0;
            P_reg[9]    <= 0;
            P_reg[10]    <= 0;
            P_reg[11]    <= 0;
            P_reg[12]    <= 0;
            m           <= 0;
        end
        else begin
            if(load_padding)    m <= data_in;
            else                m <= m; 
            
            if(load) P_reg[add] <= d_in;
            else     P_reg[add] <= P_reg[add];   
            
        end
    end
    
endmodule

module input_module_1088#(
    parameter BLOCK_LENGTH = 1088,
    parameter D_WIDTH = 64
    )(
    input                               clk,
    input                               reset,
    input   [D_WIDTH-1:0]               data_in,
    input   [4:0]                       add,
    input   [6:0]                       control,
    output  [BLOCK_LENGTH-1:0]          P
    );
    
    reg [63:0] P_reg [0:16];
    
    assign P = {P_reg[16], P_reg[15], P_reg[14], P_reg[13], P_reg[12], P_reg[11], P_reg[10], P_reg[9], P_reg[8],P_reg[7],P_reg[6],P_reg[5],P_reg[4],P_reg[3],P_reg[2],P_reg[1],P_reg[0]};
    
    reg [D_WIDTH - 1:0] m;
    
    wire rst;
    wire load_padding;
    wire start_padding;
    wire load;
    wire start;
    wire read;
    wire start_padding_double;
    
    assign rst                  = ~control[0] && reset;
    assign load_padding         = control[1];
    assign start_padding        = control[2];
    assign load                 = control[3];
    assign start                = control[4];
    assign read                 = control[5];
    assign start_padding_double = control[6];
    
    reg [D_WIDTH - 1:0] d_in;
    reg                 first_pad;
    reg                 double_pad;
    wire [D_WIDTH - 1:0] m_d;
    
    assign m_d = m >> 6;
    
    always @* begin
        if(!rst) begin
            d_in        = 0;
            first_pad   = 0;
            double_pad  = 0;
        end
        else begin
            if(start_padding_double)    double_pad = 1;
            else                        double_pad = double_pad;
            
            if(start_padding)           first_pad = 1;
            else                        first_pad = first_pad;
            
            if      (double_pad & !first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 5'b10000)  d_in = data_in + (3'b110 << m[5:0]); // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 5'b10000)  d_in = data_in + (2'b10 << m[5:0]); // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 5'b10000)  d_in = data_in + (1'b0 << m[5:0]); // 63 (bit-aligned)  
                else                                              d_in = data_in; 
            end
            else if (double_pad & first_pad) begin
                if      (m[5:0] ==  6'b111101 & add == 0)  d_in = data_in; // 61 (bit-aligned)
                else if (m[5:0] ==  6'b111110 & add == 0)  d_in = 1'b1; // 62 (bit-aligned) 
                else if (m[5:0] ==  6'b111111 & add == 0)  d_in = 2'b11; // 63 (bit-aligned)  
                else if (add == 5'b10000)                  d_in = {1'b1,data_in[62:0]};
                else                                       d_in = data_in;
            end
            else if (!double_pad & first_pad) begin
                if(m[5:0] ==  6'b111110) // 62 (bit-aligned)
                    if ((add == 5'b10000) & ((m_d + 1) == 5'b10000) & first_pad)    d_in = {1'b1,{62{1'b0}},1'b1}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (2'b10 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 1'b1;
                    else if (add == 5'b10000 & first_pad)                           d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else if(m[5:0] == 6'b111111) // 63 (bit-aligned)
                    if ((add == 5'b10000) & ((m_d + 1) == 5'b10000) & first_pad)    d_in = {1'b1,{61{1'b0}},2'b11}; // Padding in the same line
                    else if ((add == m_d) & first_pad)                              d_in = data_in + (1'b0 << m[5:0]);
                    else if ((add == (m_d + 1)) & first_pad)                        d_in = 2'b11;
                    else if (add == 5'b10000 & first_pad)                           d_in = {1'b1,data_in[62:0]};
                    else                                                            d_in = data_in;
                else begin //
                    if ((add == 5'b10000) & (m_d == 5'b10000) & first_pad)  d_in = {1'b1,data_in[62:0]} + (3'b110 << m[5:0]); // Padding in the same line
                    else if ((add == m_d) & first_pad)                      d_in = data_in + (3'b110 << m[5:0]);
                    else if (add == 5'b10000 & first_pad)                   d_in = {1'b1,data_in[62:0]};
                    else                                                    d_in = data_in;
                end
            end
            else d_in = data_in;
         end 
      end
    
    always @(posedge clk) begin
        if(!rst) begin
            P_reg[0]    <= 0;
            P_reg[1]    <= 0;
            P_reg[2]    <= 0;
            P_reg[3]    <= 0;
            P_reg[4]    <= 0;
            P_reg[5]    <= 0;
            P_reg[6]    <= 0;
            P_reg[7]    <= 0;
            P_reg[8]    <= 0;
            P_reg[9]    <= 0;
            P_reg[10]    <= 0;
            P_reg[11]    <= 0;
            P_reg[12]    <= 0;
            P_reg[13]    <= 0;
            P_reg[14]    <= 0;
            P_reg[15]    <= 0;
            P_reg[16]    <= 0;
            m           <= 0;
        end
        else begin
            if(load_padding)    m <= data_in;
            else                m <= m; 
            
            if(load) P_reg[add] <= d_in;
            else     P_reg[add] <= P_reg[add];   
            
        end
    end
    
endmodule
