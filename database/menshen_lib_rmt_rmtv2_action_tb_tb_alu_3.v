`timescale 1ns / 1ps

module tb_alu_3 #(
    parameter ACTION_LEN = 25,
    parameter META_LEN = 256,
    parameter COMP_LEN = 100
)();

localparam STAGE = 0;

reg clk;
reg rst_n;
    //the input data shall be metadata & com_ins
reg [META_LEN+COMP_LEN-1:0]       comp_meta_data_in;
reg                               comp_meta_data_valid_in;
reg [ACTION_LEN-1:0]              action_in;
reg                               action_valid_in;

    //output is the modified metadata plus comp_ins
wire [META_LEN+COMP_LEN-1:0]      comp_meta_data_out;
wire                              comp_meta_data_valid_out;   


//clk signal
localparam CYCLE = 10;

always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    rst_n = 1;
    #(10);
    rst_n = 0; //reset all the values
    #(10);
    rst_n = 1;
end


initial begin
    #(2*CYCLE); //after the rst_n, start the test
    #(5) //posedge of clk   

    /*
        multicast (modify metadata)
    */
    action_in <= {4'b1100, 8'b11111111, 13'b0};
    action_valid_in <= 1'b1;
    comp_meta_data_in <= 356'b0;
    comp_meta_data_valid_in <= 1'b1;
    #CYCLE;
    action_in <= 25'b0;
    action_valid_in <= 1'b0;
    comp_meta_data_in <= 356'b0;
    comp_meta_data_valid_in <= 1'b0;
    #(4*CYCLE);

    /* 
        discard (modify metadata)
    */
    action_in <= {4'b1101, 8'b0, 1'b1, 12'b0};
    action_valid_in <= 1'b1;
    comp_meta_data_in <= 356'b0;
    comp_meta_data_valid_in <= 1'b1;
    #CYCLE;
    action_in <= 25'b0;
    action_valid_in <= 1'b0;
    comp_meta_data_in <= 356'b0;
    comp_meta_data_valid_in <= 1'b0;
    #CYCLE;

    #(2*CYCLE);
end


alu_3 #(
    .STAGE(STAGE),
    .ACTION_LEN(),
    .META_LEN(),
    .COMP_LEN()
)alu_3_0(
    .clk(clk),
    .rst_n(rst_n),
    //input data shall be metadata & com_ins
    .comp_meta_data_in(comp_meta_data_in),
    .comp_meta_data_valid_in(comp_meta_data_valid_in),
    .action_in(action_in),
    .action_valid_in(action_valid_in),

    //output is the modified metadata plus comp_ins
    .comp_meta_data_out(comp_meta_data_out),
    .comp_meta_data_valid_out(comp_meta_data_valid_out)
);

endmodule