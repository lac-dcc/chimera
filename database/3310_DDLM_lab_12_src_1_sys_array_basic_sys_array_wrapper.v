// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module sys_array_wrapper 

#(parameter DATA_WIDTH=8,
parameter ARRAY_W=4, //i
parameter ARRAY_L=4, //j
parameter CLOCK_DIVIDE=25) 

(
    input  clk,
    input  reset_n,
    input  load_params,
    input  start_comp,
    
	 output [4*DATA_WIDTH-1:0] hex_connect
);

localparam MEM_SIZE=ARRAY_W*ARRAY_L;
localparam ARRAY_SIZE=ARRAY_W*ARRAY_W;
localparam NUM_HEX = DATA_WIDTH >> 1; //number of hex modules needed to display a result (DW / 2)

wire clk_div, ready;
wire [2*DATA_WIDTH - 1:0] output_value, empty_data_write;
wire [DATA_WIDTH*ARRAY_W*ARRAY_L - 1:0] input_data_a, input_data_b;
wire [2*DATA_WIDTH*ARRAY_W*ARRAY_W-1:0] outputs_fetcher, empty_data_out;

reg [CLOCK_DIVIDE : 0] small_cnt;
reg [1:0] propagate_reg_ctrl; //control the output of propagate parallel to serial converter register

genvar ii;

roma #(.DATA_WIDTH(DATA_WIDTH), .SIZE(MEM_SIZE)) rom_instance_a (.clk(clk), .data_rom(input_data_a));
romb #(.DATA_WIDTH(DATA_WIDTH), .SIZE(MEM_SIZE)) rom_instance_b (.clk(clk), .data_rom(input_data_b));

sys_array_fetcher #(.DATA_WIDTH(DATA_WIDTH), .ARRAY_W(ARRAY_W), .ARRAY_L(ARRAY_L)) fetching_unit
(
.clock(clk),
.reset_n(reset_n),
.load_params(~load_params),
.start_comp(~start_comp),
.input_data_b(input_data_b),
.input_data_a(input_data_a),
.ready(ready),
.out_data(outputs_fetcher)
);

clock_divider #(.DIVIDE_LEN(CLOCK_DIVIDE)) clock_divaaa (.clock(clk), .div_clock(clk_div));

shift_reg #(.DATA_WIDTH(2*DATA_WIDTH), .LENGTH(ARRAY_SIZE)) propagate_reg
(
.clock(clk_div),
.reset_n(reset_n),
.ctrl_code(propagate_reg_ctrl),
.data_in(outputs_fetcher),
.data_read(output_value),
.data_out(empty_data_out),
.data_write(empty_data_write)
);

generate
for (ii=0; ii<NUM_HEX; ii=ii+1) begin : generate_hexes
seg7_tohex hex_converter_i (.code(output_value[4*ii +: 4]), .hexadecimal(hex_connect[8*ii +: 8]));
end
endgenerate

always @(posedge clk)
begin

if (~reset_n) begin propagate_reg_ctrl <= 2'b00; small_cnt <= {(CLOCK_DIVIDE+1){1'b0}}; end

else begin

case (ready)

1'b0: propagate_reg_ctrl <= 2'b01;
1'b1: begin 
	if (small_cnt[CLOCK_DIVIDE] == 1'b0) begin propagate_reg_ctrl <= 2'b01; small_cnt <= small_cnt+1'b1; end
	else propagate_reg_ctrl <= 2'b11;
	end
default: propagate_reg_ctrl <= 2'b00;

endcase
end

end
endmodule



module clock_divider

#(parameter DIVIDE_LEN=23)

(
input clock,
output div_clock
);

reg [DIVIDE_LEN-1:0] cnt;

initial cnt <= {DIVIDE_LEN{1'b0}};

always @(posedge clock)
begin
cnt <= cnt+1'b1;
end

assign div_clock=cnt[DIVIDE_LEN-1];

endmodule