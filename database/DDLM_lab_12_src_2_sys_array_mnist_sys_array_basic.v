module sys_array_basic

#(parameter DATA_WIDTH=8,
parameter ARRAY_W=4, //i
parameter ARRAY_L=4) //j

(
    input  clk,
    input  reset_n,
    input  param_load,

    input [DATA_WIDTH*ARRAY_L-1:0] input_module,
    input [DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] parameter_data,
    output [2*DATA_WIDTH*ARRAY_W-1:0] out_module
);

wire [2*DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] output_data;

wire [DATA_WIDTH*ARRAY_W*ARRAY_L-1:0] propagate_module;

/*reg [DATA_WIDTH-1:0] param;

    always @(posedge clock)
    begin
        if (~reset_n)
        begin
				out_data <= 8'b00000000;
        end
        else if (param_load) 
		      begin
				param <= param_data;
				end
		  else
		  begin
		  out_data<= input_data*param+prop_data;
		  end	   
    end */

genvar i;
genvar j;
genvar t;

generate

for(i=0;i<ARRAY_W;i=i+1) begin : generate_array_proc
 for (j=0;j<ARRAY_L;j=j+1) begin : generate_array_proc2
 
 if ((i === 0) && (j===0))
 begin
 sys_array_cell #(.DATA_WIDTH(DATA_WIDTH)) cell_inst ( 
 .clock(clk),
 .reset_n(reset_n),
 .param_load(param_load),
 .input_data(input_module[DATA_WIDTH-1:0]),
 .prop_data({2*DATA_WIDTH{1'b0}}),
 .param_data(parameter_data[DATA_WIDTH-1:0]),
 .out_data(output_data[2*DATA_WIDTH-1:0]),
 .prop_param(propagate_module[DATA_WIDTH-1:0])
 );
 end
 else if (i === 0)
 begin
 sys_array_cell #(.DATA_WIDTH(DATA_WIDTH)) cell_inst (
 .clock(clk),
 .reset_n(reset_n),
 .param_load(param_load),
 .input_data(input_module[DATA_WIDTH*(j+1)-1:DATA_WIDTH*j]), //
 .prop_data(output_data[2*DATA_WIDTH*(ARRAY_L*i+j)-1:2*DATA_WIDTH*(ARRAY_L*i+j-1)]), //
 .param_data(parameter_data[DATA_WIDTH*(ARRAY_L*i+j+1)-1:DATA_WIDTH*(ARRAY_L*i+j)]), //
 .out_data(output_data[2*DATA_WIDTH*(ARRAY_L*i+j+1)-1:2*DATA_WIDTH*(ARRAY_L*i+j)]),
 .prop_param(propagate_module[DATA_WIDTH*(ARRAY_L*i+j+1)-1:DATA_WIDTH*(ARRAY_L*i+j)])//
 );
 end
 else if (j === 0)
 begin
 sys_array_cell #(.DATA_WIDTH(DATA_WIDTH)) cell_inst (
 .clock(clk),
 .reset_n(reset_n),
 .param_load(param_load),
 .input_data(propagate_module[DATA_WIDTH*(ARRAY_L*(i-1)+j+1)-1:DATA_WIDTH*(ARRAY_L*(i-1)+j)]),//
 .prop_data({2*DATA_WIDTH{1'b0}}), //
 .param_data(parameter_data[DATA_WIDTH*(ARRAY_L*i+j+1)-1:DATA_WIDTH*(ARRAY_L*i+j)]), //
 .out_data(output_data[2*DATA_WIDTH*(ARRAY_L*i+j+1)-1:2*DATA_WIDTH*(ARRAY_L*i+j)]),
 .prop_param(propagate_module[DATA_WIDTH*(ARRAY_L*i+j+1)-1:DATA_WIDTH*(ARRAY_L*i+j)])//
 );
 end
 else
 begin
 sys_array_cell #(.DATA_WIDTH(DATA_WIDTH)) cell_inst (
 .clock(clk),
 .reset_n(reset_n),
 .param_load(param_load),
 .input_data(propagate_module[DATA_WIDTH*(ARRAY_L*(i-1)+j+1)-1:DATA_WIDTH*(ARRAY_L*(i-1)+j)]),//
 .prop_data(output_data[2*DATA_WIDTH*(ARRAY_L*i+j)-1:2*DATA_WIDTH*(ARRAY_L*i+j-1)]), //
 .param_data(parameter_data[DATA_WIDTH*(ARRAY_L*i+j+1)-1:DATA_WIDTH*(ARRAY_L*i+j)]), //
 .out_data(output_data[2*DATA_WIDTH*(ARRAY_L*i+j+1)-1:2*DATA_WIDTH*(ARRAY_L*i+j)]),
 .prop_param(propagate_module[DATA_WIDTH*(ARRAY_L*i+j+1)-1:DATA_WIDTH*(ARRAY_L*i+j)])//
 );
 end
 
 end
end

endgenerate

generate

for (t=0;t<ARRAY_W;t=t+1) begin: output_prop
assign out_module[2*DATA_WIDTH*(t+1)-1:2*DATA_WIDTH*t] = output_data[2*DATA_WIDTH*(ARRAY_L*(t+1))-1:2*DATA_WIDTH*(ARRAY_L*(t+1)-1)];
end

endgenerate

endmodule