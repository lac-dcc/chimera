// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale  1ns/1ns
module axi_interconnect_rd_tb ();
    

reg          clk;
reg          rst;
        
reg          axi_wr_buf_wait;
reg [1:0]    channel_sel    ;
reg          axi_arready    ; 

reg          axi_rvalid     ;
reg          axi_rlast      ;


reg          hdmi_vsync     ; 
reg          hdmi_href      ; 

integer i;
integer j;

initial begin
    clk              <= 1'b1;
    rst              <= 1'b0;
    axi_wr_buf_wait  <= 1'b0;
    channel_sel      <= 2'b00;
    axi_arready      <= 1'b0;
    axi_rvalid       <= 1'b0;
    axi_rlast        <= 1'b0;
    hdmi_vsync       <= 1'b0;   
    hdmi_href        <= 1'b0;   

    #20;
    rst <=1'b1;
    #20;
    hdmi_vsync       <= 1'b1;
    #(20*50);
    hdmi_vsync       <= 1'b0;   
    #40;  

    for (i=1;i<5;i=i+1)begin
        task1();
    end

    #(20*50);

    for (j=1;j<183;j=j+1) begin
        hdmi_href        <= 1'b1;  
        #(20*1280);
        hdmi_href        <= 1'b0; 
        for (i=1;i<5;i=i+1)begin
            task1();
        end
        #1000; 
    end
end



always #10 clk =~clk;
//initial begin
//    #40;
//    for (i=1;i<1580;i=i+1)begin
//        task1();
//    end
//        axi_arready <= 1'b1;
//        #20;
//        axi_wr_buf_wait  <= 1'b1;
//        channel_sel      <= 2'b10; 
//        axi_arready <= 1'b0;
//        axi_rvalid  <= 1'b1;
//        #(19*20);
//        axi_rlast   <= 1'b1;
//        #20;
//        axi_rvalid  <= 1'b0;
//        axi_rlast   <= 1'b0;
//        #60;
//  
//    for (i=1;i<5000;i=i+1)begin
//        task1();
//    end
//    axi_wr_buf_wait  <= 1'b0;
//    channel_sel      <= 2'b01;
//    for (i=1;i<100;i=i+1)begin
//        task1();
//    end
//
//end

  task task1();
    begin
        #60;
        axi_arready <= 1'b1;
        #20;
        axi_arready <= 1'b0;
        axi_rvalid  <= 1'b1;
        #(19*20);
        axi_rlast   <= 1'b1;
        #20;
        axi_rvalid  <= 1'b0;
        axi_rlast   <= 1'b0;
        
    end
 endtask

axi_interconnect_rd axi_interconnect_rd_inst(
.clk                 (clk),
.rst                 (rst),
.axi_wr_buf_wait     (axi_wr_buf_wait),
.channel_sel         (channel_sel),  
.axi_arready         (axi_arready),  
.axi_rvalid          (axi_rvalid),  
.axi_rlast           (axi_rlast), 
.hdmi_vsync          (hdmi_vsync),
.hdmi_href           (hdmi_href)

);
endmodule