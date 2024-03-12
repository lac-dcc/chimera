`include "../defs.v"
`default_nettype none
module multi_cycle(/*autoport*/
//output
         result,
         done,
         result_mult,
         sign_mult,
//input
         clk,
         rst_n,
         exception_flush,
         op,
         flag_unsigned,
         operand1,
         operand2,
         hilo_i);
			
parameter DIV_CYCLES = 36;

input wire clk;
input wire rst_n;
input wire exception_flush;
input wire[7:0] op;
input wire flag_unsigned;
input wire [31:0] operand1;
input wire [31:0] operand2;
input wire [63:0] hilo_i;
output reg [63:0] result;
output reg done;
output wire [63:0]result_mult;
output wire sign_mult;

wire [31:0] abs_opa1, abs_opa2;
wire [63:0] mresult;
reg [63:0] tmp_result;
wire [31:0] tmp_quotient, tmp_remain;

wire [31:0] dquotient, dremain;
reg [DIV_CYCLES:0] div_stage;
wire div_done;

/*
divider divider_instance(
           .quotient(tmp_quotient),
           .remain(tmp_remain),
           .aclr(!rst_n),
           .clken(op == `OP_DIV),
           .clock(clk),
           .denom(abs_opa2),
           .numer(abs_opa1));
*/
div_uu #(.z_width(64)) div_uu0(
    .clk (clk),
    .ena (op == `OP_DIV),
    .z   ({32'h0,abs_opa1}),
    .d   (abs_opa2),
    .q   (tmp_quotient),
    .s   (tmp_remain),
    .div0(),
    .ovf ()
);

assign abs_opa1 = (flag_unsigned||!operand1[31]) ? operand1 : -operand1;
assign abs_opa2 = (flag_unsigned||!operand2[31]) ? operand2 : -operand2;

assign result_mult = abs_opa1*abs_opa2;
assign sign_mult = (flag_unsigned||!(operand1[31]^operand2[31]));
assign mresult = sign_mult ? tmp_result : -tmp_result;

assign div_done = div_stage[0];
assign dquotient = (flag_unsigned||!(operand1[31]^operand2[31])) ? tmp_quotient : -tmp_quotient;
assign dremain = (flag_unsigned||!(operand1[31]^tmp_remain[31])) ? tmp_remain : -tmp_remain;

always @(posedge clk) begin : proc_tmp_result
    tmp_result <= abs_opa1*abs_opa2;
end

always @(*) begin
    done <= div_done;
    case(op)
    `OP_MUL/*,`OP_MULT*/: begin
        result <= mresult;
    end
    `OP_MSUB: begin
        result <= hilo_i - mresult;
    end
    `OP_MADD: begin
        result <= hilo_i + mresult;
    end
    `OP_DIV: begin
        result <= {dremain, dquotient};
    end
    default: begin
        done <= 1'b1;
        result <= 64'b0;
    end
    endcase
end

always @(posedge clk) begin
    if (!rst_n) begin
        div_stage <= 'b0;
    end
    else if(exception_flush) begin
        div_stage <= 'b0;
    end
    else if(div_stage != 'b0) begin
        div_stage <= div_stage >> 1; 
    end else if(op == `OP_MUL /*|| op == `OP_MULT */|| op == `OP_MSUB || op == `OP_MADD) begin
        div_stage <= 2'b10;
    end else if(op == `OP_DIV) begin
        div_stage <= 'b1 << (DIV_CYCLES-1);
    end
end

endmodule