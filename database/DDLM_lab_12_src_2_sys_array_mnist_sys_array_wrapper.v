module sys_array_wrapper 

#(parameter DATA_WIDTH=16,
parameter ARRAY_W=10, //i
parameter ARRAY_L=784, //j
parameter CLOCK_DIVIDE=25) 

(
    input  clk,
    input  reset_n,
    input  load_params,
    input  start_comp,
    
    output [7:0] hex_connect
);

localparam MEM_SIZE=ARRAY_W*ARRAY_L;
localparam ARRAY_SIZE=ARRAY_W*ARRAY_W;

wire clk_div, ready;
wire [9:0] hex_input;
wire [DATA_WIDTH*ARRAY_W-1:0] biases;
wire [2*DATA_WIDTH*ARRAY_W - 1:0] output_value, empty_data_write;
wire [DATA_WIDTH*ARRAY_W*ARRAY_L - 1:0] input_data_a, input_data_b;
wire [2*DATA_WIDTH*ARRAY_W*ARRAY_W-1:0] outputs_fetcher, transposed_outputs, empty_data_out;

reg [CLOCK_DIVIDE : 0] small_cnt;
reg [1:0] propagate_reg_ctrl; //control the output of propagate parallel to serial converter register

genvar i,j;

roma #(.DATA_WIDTH(DATA_WIDTH), .SIZE(MEM_SIZE)) rom_instance_a (.clk(clk), .data_rom(input_data_a));
romb #(.DATA_WIDTH(DATA_WIDTH), .SIZE(MEM_SIZE)) rom_instance_b (.clk(clk), .data_rom(input_data_b));
rombias #(.DATA_WIDTH(DATA_WIDTH), .SIZE(ARRAY_W)) rom_instance_bias (.clk(clk), .data_rom(biases));

sys_array_fetcher #(.DATA_WIDTH(DATA_WIDTH), .ARRAY_W(ARRAY_W), .ARRAY_L(ARRAY_L)) fetching_unit
(
.clock(clk),
.reset_n(reset_n),
.load_params(load_params),
.start_comp(start_comp),
.input_data_b(input_data_b),
.input_data_a(input_data_a),
.ready(ready),
.out_data(outputs_fetcher)
);

generate
for (i=0;i<ARRAY_W;i=i+1) begin: transpose_i
for (j=0;j<ARRAY_W;j=j+1) begin: transpose_j
assign transposed_outputs [2*DATA_WIDTH*(ARRAY_W*j+i) +: 2*DATA_WIDTH] = outputs_fetcher [2*DATA_WIDTH*(ARRAY_W*i+j) +: 2*DATA_WIDTH];
end
end
endgenerate

clock_divider #(.DIVIDE_LEN(CLOCK_DIVIDE)) clock_divaaa (.clock(clk), .div_clock(clk_div));

shift_reg #(.DATA_WIDTH(2*DATA_WIDTH*ARRAY_W), .LENGTH(ARRAY_W)) propagate_reg
(
.clock(clk_div),
.reset_n(reset_n),
.ctrl_code(propagate_reg_ctrl),
.data_in(transposed_outputs),
.data_read(output_value),
.data_out(empty_data_out),
.data_write(empty_data_write)
);

sum_and_max #(.DATA_WIDTH(DATA_WIDTH), .LENGTH(ARRAY_W)) max_voter
(
.clk(clk_div),
.reset_n(reset_n),
.ready(ready),
.input_data(output_value),
.biases(biases),
.maxi(hex_input)
);

seg7_tohex hex_converter (.code(hex_input), .hexadecimal(hex_connect));

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