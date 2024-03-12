`timescale 1ns / 1ps
module fptr_fifo_init #(
    parameter    PTR_WID       = 9               
)
(
    input   wire                        clk                         ,   
    input   wire                        rst                         ,   
    output  wire                        fptr_fifo_wen               ,   
    output  wire [PTR_WID-1:0]          fptr_fifo_wdata             ,   
    output  reg                         init_done                       
);
localparam    RST_DELAY       = 4                                   ;    
reg  [RST_DELAY-1:0]                    rst_d                       ;    
reg  [PTR_WID:0]                        fptr_fifo_wrcnt             ;    
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        rst_d <= {RST_DELAY{1'b1}} ;
    end
    else
    begin
        rst_d <= {rst_d[RST_DELAY-2:0], 1'b0} ;
    end
end
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        fptr_fifo_wrcnt <= {1'b1, {PTR_WID{1'b0}}} ;
    end
    else if (( rst_d[RST_DELAY-1] == 1'b1 ) && ( rst_d[RST_DELAY-2] == 1'b0 ))
    begin
        fptr_fifo_wrcnt <= {(PTR_WID+1){1'b0}} ;
    end
    else if ( fptr_fifo_wrcnt[PTR_WID] != 1'b1 )
    begin
        fptr_fifo_wrcnt <= fptr_fifo_wrcnt + {{PTR_WID{1'b0}}, 1'b1} ;
    end
    else ;
end
assign fptr_fifo_wen   = ( fptr_fifo_wrcnt[PTR_WID] != 1'b1 ) ? 1'b1 : 1'b0 ;
assign fptr_fifo_wdata = fptr_fifo_wrcnt[PTR_WID-1:0] ;
always @( posedge clk or posedge rst )
begin
    if ( rst == 1'b1 )
    begin
        init_done <= 1'b0 ;
    end
    else if ( fptr_fifo_wrcnt[PTR_WID-1:0] == {PTR_WID{1'b1}} )
    begin
        init_done <= 1'b1 ;
    end
    else ;
end
endmodule
