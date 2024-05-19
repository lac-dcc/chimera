// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10fs

module tb_top;

    reg clk;
    reg rst_n;
    
    reg [7:0] mem[131072:0];
    
    initial
    begin
        forever
        begin 
            #5 clk = ~clk;
        end
    end
    
    wire          mem_i_rd_w;
    wire          mem_i_flush_w;
    wire          mem_i_invalidate_w;
    wire [ 31:0]  mem_i_pc_w;
    wire [ 31:0]  mem_d_addr_w;
    wire [ 31:0]  mem_d_data_wr_w;
    wire          mem_d_rd_w;
    wire [  3:0]  mem_d_wr_w;
    wire          mem_d_cacheable_w;
    wire [ 10:0]  mem_d_req_tag_w;
    wire          mem_d_invalidate_w;
    wire          mem_d_writeback_w;
    wire          mem_d_flush_w;
    wire          mem_i_accept_w;
    wire          mem_i_valid_w;
    wire          mem_i_error_w;
    wire [ 63:0]  mem_i_inst_w;
    wire [ 31:0]  mem_d_data_rd_w;
    wire          mem_d_accept_w;
    wire          mem_d_ack_w;
    wire          mem_d_error_w;
    wire [ 10:0]  mem_d_resp_tag_w;

    wire          tck_w;  
    wire          tms_w;  
    wire          tdi_w;  
    wire          tdo_w; 
    
    riscv_core u_dut
    (
        // Inputs
        .clk                  (clk)              ,    
        .rst_n                (rst_n)            ,
        .mem_d_data_rd_i      (mem_d_data_rd_w)  ,
        .mem_d_accept_i       (mem_d_accept_w)   ,
        .mem_d_ack_i          (mem_d_ack_w)      ,
        .mem_d_error_i        (mem_d_error_w)    ,
        .mem_d_resp_tag_i     (mem_d_resp_tag_w) ,
        .mem_i_accept_i       (mem_i_accept_w)   ,
        .mem_i_valid_i        (mem_i_valid_w)    ,
        .mem_i_error_i        (mem_i_error_w)    ,
        .mem_i_inst_i         (mem_i_inst_w)     ,
        .intr_i               (1'b0)             ,
        .reset_vector_i       (32'h80000000)     ,
        .cpu_id_i             ('b0)              ,
    
        // Outputs
        .mem_d_addr_o         (mem_d_addr_w)       , 
        .mem_d_data_wr_o      (mem_d_data_wr_w)    ,
        .mem_d_rd_o           (mem_d_rd_w)         ,
        .mem_d_wr_o           (mem_d_wr_w)         ,
        .mem_d_cacheable_o    (mem_d_cacheable_w)  ,
        .mem_d_req_tag_o      (mem_d_req_tag_w)    ,
        .mem_d_invalidate_o   (mem_d_invalidate_w) ,
        .mem_d_writeback_o    (mem_d_writeback_w)  ,
        .mem_d_flush_o        (mem_d_flush_w)      ,
        .mem_i_rd_o           (mem_i_rd_w)         ,
        .mem_i_flush_o        (mem_i_flush_w)      ,
        .mem_i_invalidate_o   (mem_i_invalidate_w) ,
        .mem_i_pc_o           (mem_i_pc_w)         ,

        // JTAG
        .tck_i                (tck_w) , 
        .tms_i                (tms_w) , 
        .tdi_i                (tdi_w) , 
        .tdo_o                (tdo_w)  
    );
    
    tcm_mem u_mem
    (
        // Inputs
        .clk                   (clk)                 ,  
        .rst_n                 (rst_n)               ,
        .mem_i_rd_i            (mem_i_rd_w)          ,
        .mem_i_flush_i         (mem_i_flush_w)       ,
        .mem_i_invalidate_i    (mem_i_invalidate_w)  ,
        .mem_i_pc_i            (mem_i_pc_w)          ,
        .mem_d_addr_i          (mem_d_addr_w)        ,
        .mem_d_data_wr_i       (mem_d_data_wr_w)     ,
        .mem_d_rd_i            (mem_d_rd_w)          ,
        .mem_d_wr_i            (mem_d_wr_w)          ,
        .mem_d_cacheable_i     (mem_d_cacheable_w)   ,
        .mem_d_req_tag_i       (mem_d_req_tag_w)     ,
        .mem_d_invalidate_i    (mem_d_invalidate_w)  ,
        .mem_d_writeback_i     (mem_d_writeback_w)   ,
        .mem_d_flush_i         (mem_d_flush_w)       ,
    
        // Outputs
        .mem_i_accept_o        (mem_i_accept_w)      ,  
        .mem_i_valid_o         (mem_i_valid_w)       ,
        .mem_i_error_o         (mem_i_error_w)       ,
        .mem_i_inst_o          (mem_i_inst_w)        ,
        .mem_d_data_rd_o       (mem_d_data_rd_w)     ,
        .mem_d_accept_o        (mem_d_accept_w)      ,
        .mem_d_ack_o           (mem_d_ack_w)         ,
        .mem_d_error_o         (mem_d_error_w)       ,
        .mem_d_resp_tag_o      (mem_d_resp_tag_w)    
    );
    
endmodule
