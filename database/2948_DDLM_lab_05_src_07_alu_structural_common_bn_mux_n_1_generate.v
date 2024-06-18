// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module bn_mux_n_1_generate
#( parameter  DATA_WIDTH = 8,
   parameter  SEL_WIDTH   = 2) 
(
    input   [((2**SEL_WIDTH)*DATA_WIDTH)-1:0] data,
    input   [SEL_WIDTH-1:0]                   sel,   
    output  [DATA_WIDTH-1:0]                  y
);
wire    [DATA_WIDTH-1:0] tmp_array [0:(2**SEL_WIDTH)-1];
genvar i;
generate
    for(i=0; i<2**SEL_WIDTH; i=i+1) 
    begin: gen_array
        assign  tmp_array[i] = data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)];
    end
endgenerate
    assign  y =  tmp_array[sel];
endmodule
