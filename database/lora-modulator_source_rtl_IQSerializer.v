// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "RadioDefines.v"

module IQSerializer(
input                   clk,
input                   start,
input   [`ILength-1:0]  I,
input   [`QLength-1:0]  Q,
output                  serial_N,
output                  serial,
output                  serial_clk
);

parameter VCC = 1'b1;
parameter VSS = 1'b0;

//states
reg [3:0] current_state;
reg [3:0] next_state;
parameter [3:0] Init0 = 4'h0, Init1 = 4'h1, ISYNC = 4'h2, IDATA  = 4'h3, QSYNC = 4'h4, QDATA = 4'h5;

(* syn_preserve = "TRUE" *) reg [3:0]   ICounter;
(* syn_preserve = "TRUE" *) reg [3:0]   QCounter;

//output clock
assign serial_clk    = clk;

//Double Edge DFF
reg     DEDFF_D0;
reg     DEDFF_D1;
wire    DEDFF_Q;
wire    DEDFF_rst;
assign serial       = DEDFF_Q;
assign serial_N     = ~DEDFF_Q;
assign DEDFF_rst    = start;

/*
*   Update Double Edge DFF
*/
always @(*) begin
    case(current_state)
        Init0: begin
            DEDFF_D0 = VSS;
            DEDFF_D1 = VSS;
        end
        Init1: begin
            DEDFF_D0 = VSS;
            DEDFF_D1 = VSS;
        end
        ISYNC: begin
            DEDFF_D0 = VCC;
            DEDFF_D1 = VSS;
        end
        IDATA: begin
            DEDFF_D0 = I[`ILength-ICounter-1];
            DEDFF_D1 = I[`ILength-ICounter-2];
        end
        QSYNC: begin
            DEDFF_D0 = VSS;
            DEDFF_D1 = VCC;
        end
        QDATA: begin
            DEDFF_D0 = Q[`QLength-QCounter-1];
            DEDFF_D1 = Q[`QLength-QCounter-2];
        end
        default: begin
            DEDFF_D0 = VSS;
            DEDFF_D1 = VSS;
        end
    endcase
end

/*
*   Update Counters
*/
always @(negedge clk) begin
    if (start == VSS) begin
        ICounter    <= 4'd0;
        QCounter    <= 4'd0;
        //I           <= `ILength'd0;
        //Q           <= `QLength'h0;
    end else begin
        if (current_state == IDATA) ICounter    <= ICounter + 4'd2;
        else                        ICounter    <= 4'd0;

        if (current_state == QDATA) QCounter    <= QCounter + 4'd2;
        else                        QCounter    <= 4'd0;
        
        //uncomment this for constant I/Q
        //I <= `ILength'b11000000000011;
        //Q <= `QLength'b00111111111100;

        //if (current_state == QSYNC) I <= I + 1;
        //else                        I <= I;
//
        //if (current_state == ISYNC) Q <= Q + 1;
        //else                        Q <= Q;
    end
end


/*
*   Next States
*/
always @(negedge clk) begin
    current_state   <= next_state;
end

always @(*) begin
    if (start == VSS) begin
        next_state  = Init0;
    end else begin
        case(current_state)
            Init0: begin
                next_state      = ISYNC;
            end
            Init1: begin
                next_state      = ISYNC;
            end
            ISYNC: begin                
                next_state      = IDATA;
            end
            IDATA: begin
                if (ICounter == 4'd12) begin
                    next_state  = QSYNC;
                end else begin
                    next_state  = IDATA;
                end
            end
            QSYNC: begin
                next_state      = QDATA;
            end
            QDATA: begin
                if (QCounter == 4'd12) begin
                    next_state  = ISYNC;
                end else begin
                    next_state  = QDATA;
                end
            end
            default: begin
                next_state      = Init0;
            end
        endcase
    end
end


DEDFF DEDFF_0(
    // Inputs
    .clk(clk),
    .rst(DEDFF_rst),
    .D0(DEDFF_D0),
    .D1(DEDFF_D1),
    // Outputs
    .Q(DEDFF_Q)
);

endmodule

