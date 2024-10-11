// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

module MAC #
(
    parameter integer DATA_WIDTH = 1
)
(
    //global
    input wire clk,
    input wire rst_n,

    //data
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row0_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row1_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row2_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row3_in,
    input wire [DATA_WIDTH-1:0] ifmaps_fifo_row4_in,

    input wire [24:0] weight_in,

    output wire [4:0] MAC_out,

    //control
    input wire enable,
    input wire ifmaps_input_valid,

    input wire load_ifmaps,
    input wire load_weight,

    input wire [1:0] operation,
    input wire [4:0] kernel_size

);
//2022/08/31已測試
    reg load_ifmaps_buf_1t;

    wire ifmaps_fifo_row0_out,ifmaps_fifo_row1_out,ifmaps_fifo_row2_out,ifmaps_fifo_row3_out,ifmaps_fifo_row4_out;
    wire fifo_full,fifo_empty;//unuse 如果發生full或是empty代表硬體設計有誤

 
    // FIFO的output有reg因此MAC須慢1t才能load
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            load_ifmaps_buf_1t<=0;
        end
        else begin
            load_ifmaps_buf_1t<=load_ifmaps;
        end
    end

    MAC_ifmaps_FIFO 
    #(
        .DATA_WIDTH (DATA_WIDTH )
    )
    u_MAC_ifmaps_FIFO(
    	.clk                  (clk                  ),
        .rst_n                (rst_n                ),
        .ifmaps_fifo_row0_in  (ifmaps_fifo_row0_in  ),
        .ifmaps_fifo_row1_in  (ifmaps_fifo_row1_in  ),
        .ifmaps_fifo_row2_in  (ifmaps_fifo_row2_in  ),
        .ifmaps_fifo_row3_in  (ifmaps_fifo_row3_in  ),
        .ifmaps_fifo_row4_in  (ifmaps_fifo_row4_in  ),
        .ifmaps_input_valid   (ifmaps_input_valid   ),
        .ifmaps_fifo_row0_out (ifmaps_fifo_row0_out ),
        .ifmaps_fifo_row1_out (ifmaps_fifo_row1_out ),
        .ifmaps_fifo_row2_out (ifmaps_fifo_row2_out ),
        .ifmaps_fifo_row3_out (ifmaps_fifo_row3_out ),
        .ifmaps_fifo_row4_out (ifmaps_fifo_row4_out ),
        .fifo_read            (load_ifmaps          ),
        .fifo_full            (fifo_full            ),
        .fifo_empty           (fifo_empty           )
    );
    
    ALU u_ALU(
    	.clk            (clk                  ),
        .rst_n          (rst_n                ),
        .ifmaps_row0_in (ifmaps_fifo_row0_out ),
        .ifmaps_row1_in (ifmaps_fifo_row1_out ),
        .ifmaps_row2_in (ifmaps_fifo_row2_out ),
        .ifmaps_row3_in (ifmaps_fifo_row3_out ),
        .ifmaps_row4_in (ifmaps_fifo_row4_out ),
        .weight_in      (weight_in            ),
        .MAC_out        (MAC_out              ),
        .enable         (enable               ),
        .load_ifmaps    (load_ifmaps_buf_1t   ),
        .load_weight    (load_weight          ),
        .operation      (operation            ),
        .kernel_size    (kernel_size          )
    );
    
    
    
    
endmodule