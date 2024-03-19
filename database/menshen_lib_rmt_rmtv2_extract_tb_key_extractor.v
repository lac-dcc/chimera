`timescale 1ns / 1ps

module tb_key_extract #(
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256,
    parameter KEY_LEN = 48*2+32*2+16*2+5,
    parameter KEY_OFF = (3+3)*3
)();

reg                      clk;
reg                      rst_n;
reg [PHV_LEN-1:0]        phv_in;
reg                      phv_valid_in;
    
//signals used to config key extract offset
reg [KEY_OFF-1:0]        key_offset_in;
reg                      key_offset_valid_in;

wire [PHV_LEN-1:0]       phv_out;
wire                     phv_valid_out;
wire [KEY_LEN-1:0]       key_out;
wire                     key_valid_out;

localparam STAGE = 0;

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
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    key_offset_in <= {3'd6, 3'd7, 3'd6, 3'd7, 3'd6, 3'd7};
    key_offset_valid_in <= 1'b1;
    #CYCLE
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    key_offset_in <= 18'b0;
    key_offset_valid_in <= 1'b0;
    #(2*CYCLE)

    /*
        switch the value in container 7 and 6
    */
    phv_in <= {48'hffffffffffff, 48'heeeeeeeeeeee, 288'h0, 32'hcccccccc, 32'hbbbbbbbb, 192'b0, 16'hffff, 16'heeee, 96'h0, 356'b0};
    phv_valid_in <= 1'b1;
    key_offset_in <= {3'd6, 3'd7, 3'd6, 3'd7, 3'd6, 3'd7};
    key_offset_valid_in <= 1'b0;
    #CYCLE
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    key_offset_in <= 18'b0;
    key_offset_valid_in <= 1'b0;
    #(2*CYCLE);

    /*
        check if comparator works right
    */
    
    phv_in <= {48'hffffffffffff, 48'heeeeeeeeeeee, 288'h0, 32'hcccccccc, 32'hbbbbbbbb, 192'b0, 16'hffff, 
        16'heeee, 96'h0, 2'b0, 4'b0, 2'b10, 3'd7,4'b0, 2'b10, 3'd6,80'b0,256'b0};
    phv_valid_in <= 1'b1;
    key_offset_in <= {3'd6, 3'd7, 3'd6, 3'd7, 3'd6, 3'd7};
    key_offset_valid_in <= 1'b0;
    #CYCLE
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    key_offset_in <= 18'b0;
    key_offset_valid_in <= 1'b0;
    #(2*CYCLE);

end



key_extract #(
    .STAGE(STAGE),
    .PHV_LEN(),
    .KEY_LEN(),
    .KEY_OFF()
)key_extract(
    .clk(clk),
    .rst_n(rst_n),
    .phv_in(phv_in),
    .phv_valid_in(phv_valid_in),
    //signals used to config key extract offset
    .key_offset_in(key_offset_in),
    .key_offset_valid_in(key_offset_valid_in),
    .phv_out(phv_out),
    .phv_valid_out(phv_valid_out),
    .key_out(key_out),
    .key_valid_out(key_valid_out)
);
endmodule