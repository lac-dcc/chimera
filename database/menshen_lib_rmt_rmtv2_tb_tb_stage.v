`timescale 1ns / 1ps

module tb_stage #(
    parameter STAGE = 0,  //valid: 0-4
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256,
    parameter KEY_LEN = 48*2+32*2+16*2+5,
    parameter ACT_LEN = 25,
    parameter KEY_OFF = 3*6
)();

reg                      clk;
reg                      rst_n;

reg [PHV_LEN-1:0]        phv_in;
reg                      phv_in_valid;

wire [PHV_LEN-1:0]       phv_out;
wire                     phv_out_valid;

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
        set up the key extract table
    */
    /*
        give it a random phv to see what we can get
    */
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    #CYCLE
    phv_in <= {48'hffffffffffff, 48'heeeeeeeeeeee, 288'h0, 32'hcccccccc, 32'hbbbbbbbb, 192'b0, 16'hffff, 16'heeee, 96'h0, 356'b0};
    phv_in_valid <= 1'b1;
    #CYCLE
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    #(4*CYCLE)

    /*
        switch the value in container 7 and 6
    */
    phv_in <= {48'hffffffffffff, 48'heeeeeeeeeeee, 288'h0, 32'hcccccccc, 32'hbbbbbbbb, 192'b0, 16'hffff, 16'heeee, 96'h0, 356'b0};
    phv_in_valid <= 1'b1;
    #CYCLE
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    #(4*CYCLE);

end


stage #(
    .STAGE(STAGE),
    .PHV_LEN(),
    .KEY_LEN(),
    .ACT_LEN(),
    .KEY_OFF()    
)stage(
    .axis_clk(clk),
    .aresetn(rst_n),

    .phv_in(phv_in),
    .phv_in_valid(phv_in_valid),
    .phv_out(phv_out),
    .phv_out_valid(phv_out_valid)
);
endmodule