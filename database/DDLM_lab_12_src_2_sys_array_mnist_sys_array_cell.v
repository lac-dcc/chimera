// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module sys_array_cell

#(parameter DATA_WIDTH=8)

(
    input  clock,
    input  reset_n,
    input  param_load,

    input  signed [DATA_WIDTH - 1:0] input_data,
    input  signed [2*DATA_WIDTH-1:0] prop_data,
    input  signed [DATA_WIDTH-1:0] param_data,
    output reg signed [2*DATA_WIDTH-1:0] out_data,
    output reg signed [DATA_WIDTH-1:0] prop_param
);

reg signed [DATA_WIDTH-1:0] param;

    always @(posedge clock)
    begin
        if (~reset_n)
        begin
				out_data <= {2*DATA_WIDTH{1'b0}};
                                param <= {DATA_WIDTH{1'b0}};
        end
        else if (param_load) 
		      begin
				param <= param_data;
				end
		  else
		  begin
		  out_data<= prop_data+input_data*param;
		  prop_param <= input_data;
		  end	   
    end

endmodule