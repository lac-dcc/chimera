// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module sys_array_fetcher

#(parameter DATA_WIDTH=8,
parameter ARRAY_W=4, //i
parameter ARRAY_L=4) //j

(
    input  clock,
    input  reset_n,
    input  load_params,
    input  start_comp,

    input  [DATA_WIDTH*ARRAY_W*ARRAY_L - 1:0] input_data_a,
    input  [DATA_WIDTH*ARRAY_W*ARRAY_L - 1:0] input_data_b,
	 output reg ready,
    output reg [2*DATA_WIDTH*ARRAY_W*ARRAY_W-1:0] out_data
);

    localparam FETCH_LENGTH = ARRAY_L+ARRAY_W*2+1; //necessary amount of clk cycles to perform fetching and get back the results

reg [15:0] cnt; //counter
reg [ARRAY_L*2-1:0] control_sr_read;
reg [ARRAY_W*2-1:0] control_sr_write;
wire [DATA_WIDTH*ARRAY_L - 1:0] input_sys_array;
wire [DATA_WIDTH*ARRAY_L - 1:0] empty_wire_reads; //wire to connect read SRs' write ports
wire [DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] empty_wire2_reads; //for read SR's out ports
wire [2*DATA_WIDTH*ARRAY_W*ARRAY_W-1:0] empty_wire_writes; //for write SR's in ports
wire [2*DATA_WIDTH*ARRAY_W - 1:0] empty_wire2_writes; //for write SRs' read ports
wire [2*DATA_WIDTH*ARRAY_W - 1:0] output_sys_array;
wire [2*DATA_WIDTH*ARRAY_W*ARRAY_W-1:0] output_wire; //for write SR's out ports
genvar i,j;
wire [DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] transposed_a; //transposing a matrix

//transpose matrix a
generate
for (i=0;i<ARRAY_W;i=i+1) begin: transpose_i
for (j=0;j<ARRAY_L;j=j+1) begin: transpose_j
assign transposed_a [DATA_WIDTH*(ARRAY_W*j+i) +: DATA_WIDTH] = input_data_a [DATA_WIDTH*(ARRAY_L*i+j) +: DATA_WIDTH];
end
end
endgenerate

shift_reg #(.DATA_WIDTH(DATA_WIDTH), .LENGTH(ARRAY_W)) reads[ARRAY_L-1:0] (clock, reset_n, control_sr_read, transposed_a, empty_wire_reads, input_sys_array, empty_wire2_reads); //read shift registers
shift_reg #(.DATA_WIDTH(2*DATA_WIDTH), .LENGTH(ARRAY_W)) writes[ARRAY_W-1:0] (clock, reset_n, control_sr_write, empty_wire_writes, output_sys_array, empty_wire2_writes, output_wire); //write shift registers

sys_array_basic #(.DATA_WIDTH(DATA_WIDTH), .ARRAY_W(ARRAY_W), .ARRAY_L(ARRAY_L)) systolic_array
(
.clk(clock),
.reset_n(reset_n),
.param_load(load_params),
.parameter_data(input_data_b),
.input_module(input_sys_array),
.out_module(output_sys_array)
);

always @(posedge clock)
begin

if (~reset_n) //reset case
begin
cnt <= 15'd0;
control_sr_read <= {ARRAY_L*2{1'b0}};
control_sr_write <= {ARRAY_W*2{1'b0}};
ready <= 1'b0;
end

else if(start_comp) //initiate computation
begin
cnt <= 15'd1;
control_sr_read <= {ARRAY_L{2'b01}}; //initiate loading read registers
end

else if (cnt>0) //compute the whole thing
begin

if (cnt == 1) //fetch data into first array input
begin
control_sr_read[2*ARRAY_L-1:2] <= {2*(ARRAY_L-1){1'b0}}; //idle mode on read registers
control_sr_read[1:0] <= 2'b11; //read mode on 1st register
cnt <= cnt+1'b1;
end

else //fetching logic
begin
if (cnt < ARRAY_L+1) //enable read registers
control_sr_read[2*(cnt-1) +: 2] = 2'b11; 
if ((cnt > ARRAY_W) && (cnt < ARRAY_L+ARRAY_W+1)) //start disabling read registers
control_sr_read[2*(cnt-ARRAY_W-1) +: 2] = 2'b00;
if ((cnt > ARRAY_L+1) && (cnt < ARRAY_L+ARRAY_W+2)) //enable write registers
control_sr_write[2*(cnt-ARRAY_L-2) +: 2] = 2'b10;
if ((cnt>ARRAY_L+ARRAY_W+1) && (cnt<=FETCH_LENGTH)) //start disabling write registers
control_sr_write[2*(cnt-(ARRAY_L+ARRAY_W)-2) +: 2] = 2'b00;
if (cnt <= FETCH_LENGTH+1)
cnt = cnt+1'b1;
else begin//propagate outputs.
cnt <= 15'd0;
out_data <= output_wire;
ready <= 1'b1;
end
end

end
end

endmodule