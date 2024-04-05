// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  hwpe_tb.v
// Module  name  :  hwpe_tb
// Created Time  :  2018/5/17 21:41:34
// Last Modified :  2018/5/27 11:09:52
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/17  chenhaoc
//
// ********************************************************

`include "hwpe_define.vh"
`include "./testcase/inter_layer_4b.vh"
`define DLY 1
`timescale 1ns/10ps

module hwpe_tb();
reg clk;
reg mcu_rst;
always #5 clk = ~clk;

reg                         dma_wen;
reg  [`HWPE_ADDR_WIDTH-1:0] dma_wa;
reg  [63:0]                 dma_wd;

//=================   E A I   ====================
//request channel
wire          eai_req_valid;
wire          eai_req_ready;
wire [31:0]   eai_req_instr;
wire [31:0]   eai_req_rs1;
wire [31:0]   eai_req_rs2;
wire [1:0]    eai_req_itag;

//response channel
wire          eai_rsp_valid;
wire          eai_rsp_ready;
wire [31:0]   eai_rsp_wdat;
wire [1:0]    eai_rsp_itag;
wire          eai_rsp_err;

//memory request channel
wire          eai_icb_cmd_valid;
wire          eai_icb_cmd_ready;
wire [31:0]   eai_icb_cmd_addr;
wire          eai_icb_cmd_read;
wire [31:0]   eai_icb_cmd_wdata;
wire [3:0]    eai_icb_cmd_wmask;

//memory response channel
wire          eai_icb_rsp_valid;
wire          eai_icb_rsp_ready;
wire [31:0]   eai_icb_rsp_rdata;
wire          eai_icb_rsp_err;
    //memory holdup
wire          eai_mem_holdup;

parameter FMAP_BYTES_LEN = 4624;
parameter KERNEL_BYTES_LEN = 4608;
parameter CONV_32B_LEN = 2048;
parameter INSTR_LEN = 2183;

parameter N = `D_Data_type==1?2:`D_Data_type==2?4:`D_Data_type==3?8:8;
parameter FMAP_1SRAM_64BITS_NEED = ((((`D_H-`D_Kernel_size)/`D_STRIDE+1)/2-1)*`D_STRIDE+`D_Kernel_size)*`D_H*`D_C*N/64;
parameter FMAP_ADDR2_ST_RD = (`D_W-((((`D_H-`D_Kernel_size)/`D_STRIDE+1)/2-1)*`D_STRIDE+`D_Kernel_size))*`D_H*`D_C*N/8;
reg [7:0] fmap_mem[0:FMAP_BYTES_LEN-1];
reg [7:0] kernel_mem[0:KERNEL_BYTES_LEN-1];
reg [31:0] conv_mem[0:CONV_32B_LEN-1];
reg [31:0] conv_out[0:CONV_32B_LEN-1];
reg [95:0] instr_mem[0:INSTR_LEN-1];
integer pc;
integer error_cnt;
integer err_cnt;
reg fmap_mem_done;
reg kernel_mem_done;
integer kernel_wa;
integer kernel_ra;
integer fmap_wa;
integer fmap_ra;
integer conv_out_h_file;
integer conv_out_d_file;
integer conv_out_err_log;
integer conv_out_i;

reg send_instr;
reg [31:0] instr;
reg [31:0] rs1_data;
reg [31:0] rs2_data;
//==================== Initial ===========================
initial begin
    clk = 0;
    mcu_rst = 1;
    send_instr = 0;
    pc = 0;
    error_cnt = 0;
    err_cnt = 0;
    conv_out_h_file=$fopen("./output/conv_out_h.txt");
    conv_out_d_file=$fopen("./output/conv_out_d.txt");
    conv_out_err_log=$fopen("./output/conv_out_error.log");
    $readmemh("./testcase/conv_4b.txt",conv_mem);
    $readmemh("./testcase/instr.txt",instr_mem);
    @(posedge clk);
    @(negedge clk);
    mcu_rst = 0;

//----------------------- D M A -----------------------------
    //-------- FMAP ----------------
    fmap_wa = 0;
    fmap_ra = 0;
    $readmemh("./testcase/featuremap_4b.txt",fmap_mem);
    // repeat (FMAP_BYTES_LEN/2/8+40) @(posedge clk) begin //need plus 1 column because of overlap
    repeat (FMAP_1SRAM_64BITS_NEED) @(posedge clk) begin //need plus 1 column because of overlap
        write_fmap_mem();
        fmap_wa <= #`DLY fmap_wa+8;
        fmap_ra <= #`DLY fmap_ra+8;
    end
    @(negedge clk) fmap_wa = `FMEM_ADDR2_START;
    // fmap_ra=FMAP_BYTES_LEN/2-40*8; //start address of fmap2 sram
    fmap_ra=FMAP_ADDR2_ST_RD; //start address of fmap2 sram
    // repeat (FMAP_BYTES_LEN/2/8+40) @(posedge clk) begin
    repeat (FMAP_1SRAM_64BITS_NEED) @(posedge clk) begin
        write_fmap_mem();
        fmap_wa <= #`DLY fmap_wa+8;
        fmap_ra <= #`DLY fmap_ra+8;
    end
    fmap_mem_done = 1'b1;

    //-------- KERNEL ----------------
    @(negedge clk);
    kernel_wa = `KMEM_ADDR_START;
    kernel_ra = 0;
    $readmemh("./testcase/fmapfilter_4b.txt",kernel_mem);
    repeat (KERNEL_BYTES_LEN/8) @(posedge clk) begin
        write_kernel_mem();
        kernel_wa <= #`DLY kernel_wa+8;
        kernel_ra <= #`DLY kernel_ra+8;
    end
    @(posedge clk) kernel_mem_done <= #`DLY 1'b1;
    dma_wen = 1'b0;

    @(posedge clk);
    run(instr_mem[pc]);

    //-------------- CHECK OUTPUT ------------------
    wait(pc==INSTR_LEN-1) begin
        repeat (10) @(posedge clk);
        for(conv_out_i=0;conv_out_i<CONV_32B_LEN;conv_out_i=conv_out_i+1)
        begin
            if(conv_out[conv_out_i]==conv_mem[conv_out_i]) ;
            else begin
                err_cnt = err_cnt+1;
                $fdisplay(conv_out_err_log,"err_cnt=%5d, i=%5d, conv_out=%8h\tconv=%8h",err_cnt,conv_out_i+1,conv_out[conv_out_i],conv_mem[conv_out_i]);
            end
            $fdisplay(conv_out_h_file,"%8h",conv_out[conv_out_i]);
            $fdisplay(conv_out_d_file,"%d",$signed(conv_out[conv_out_i]));
        end
    end
    $fclose(conv_out_h_file);
    $fclose(conv_out_d_file);
    $fclose(conv_out_err_log);
    $display("========================================================");
    if(err_cnt==0) begin
        $display("========  SIMULATION PASSED! Congratulations!  =========");
    end else begin
        $display("=======  SIMULATION FAILED! ERROR_CNT = %5d!  ========",err_cnt);
    end
    $display("========================================================");
    $stop;
end

//========= tasks ===============
task write_fmap_mem();
    begin
        dma_wen = 1'b1;
        dma_wa = fmap_wa;
        dma_wd = {fmap_mem[fmap_ra+7],fmap_mem[fmap_ra+6],fmap_mem[fmap_ra+5],fmap_mem[fmap_ra+4],
                         fmap_mem[fmap_ra+3],fmap_mem[fmap_ra+2],fmap_mem[fmap_ra+1],fmap_mem[fmap_ra]};
    end
endtask
task write_kernel_mem();
    begin
        dma_wen = 1'b1;
        dma_wa = kernel_wa;
        dma_wd = {kernel_mem[kernel_ra+7],kernel_mem[kernel_ra+6],kernel_mem[kernel_ra+5],kernel_mem[kernel_ra+4],
                         kernel_mem[kernel_ra+3],kernel_mem[kernel_ra+2],kernel_mem[kernel_ra+1],kernel_mem[kernel_ra]};
    end
endtask

//================== Run Instr ======================
always @(posedge clk) begin
    if(eai_rsp_valid&eai_rsp_ready) begin
        pc = pc + 1;
        run(instr_mem[pc]);
    end
end

task run( input [95:0] ins);
    begin
        repeat(2) @(posedge clk);
        send_instr <= #`DLY 1'b1;
        instr    <= #`DLY ins[95:64];
        rs1_data <= #`DLY ins[63:32];
        rs2_data <= #`DLY ins[31:0];
        @(posedge clk);
        send_instr <= #`DLY 1'b0;
    end
endtask

//=================== Moniter & Collect Output ========================

reg  [9:0] countK;
reg  [15:0]countW;
reg  [15:0]countH;
wire [9:0]  countK_w;
wire [15:0] countW_w;
wire [15:0] countH_w;
wire [9:0]  K_count;
wire [15:0] W_count;
wire [15:0] H_count;
integer row;
integer pe;
integer out_w;
integer out_h;
integer out_k;
integer idx;
integer idx2;
assign countK_w = u_hwpe.u_data_fetcher.conv_lastrow ? K_count-u_hwpe.u_data_fetcher.countK : countK;
assign countW_w = u_hwpe.u_data_fetcher.conv_lastrow ? W_count-u_hwpe.u_data_fetcher.countW : countW;
assign countH_w = u_hwpe.u_data_fetcher.conv_lastrow ? H_count-u_hwpe.u_data_fetcher.countH : countH;
assign K_count = u_hwpe.K_count;
assign W_count = u_hwpe.W_count;
assign H_count = u_hwpe.H_count;
always @(posedge clk) begin
    countK <= #`DLY countK_w;
    countW <= #`DLY countW_w;
    countH <= #`DLY countH_w;
end

always @(posedge clk) begin
    if(u_hwpe.u_instr_de.xd&eai_rsp_valid&eai_rsp_ready) begin
        row = u_hwpe.acc_r_acc_id;
        pe = u_hwpe.acc_r_pe_id;
        out_w = countW + (row%2)*W_count;
        out_h = countH + (row/2)*H_count;
        out_k = 16*countK + pe;
        idx2 = out_w*H_count*K_count*4*16+out_h*K_count*16+out_k;
        conv_out[idx2] = eai_rsp_wdat;
    end
end

//======================= Instances =====================
hwpe  u_hwpe(
         .clk                   (clk                    )
        ,.dma_wen               (dma_wen                )
        ,.dma_wa                (dma_wa                 )
        ,.dma_wd                (dma_wd                 )
        ,.eai_req_valid         (eai_req_valid          )
        ,.eai_req_ready         (eai_req_ready          )
        ,.eai_req_instr         (eai_req_instr          )
        ,.eai_req_rs1           (eai_req_rs1            )
        ,.eai_req_rs2           (eai_req_rs2            )
        ,.eai_req_itag          (eai_req_itag           )
        ,.eai_rsp_valid         (eai_rsp_valid          )
        ,.eai_rsp_ready         (eai_rsp_ready          )
        ,.eai_rsp_wdat          (eai_rsp_wdat           )
        ,.eai_rsp_itag          (eai_rsp_itag           )
        ,.eai_rsp_err           (eai_rsp_err            )
        ,.eai_icb_cmd_valid	(eai_icb_cmd_valid	)
        ,.eai_icb_cmd_ready	(eai_icb_cmd_ready	)
        ,.eai_icb_cmd_addr	(eai_icb_cmd_addr	)
        ,.eai_icb_cmd_read	(eai_icb_cmd_read	)
        ,.eai_icb_cmd_wdata	(eai_icb_cmd_wdata	)
        ,.eai_icb_cmd_wmask	(eai_icb_cmd_wmask	)
        ,.eai_icb_rsp_valid	(eai_icb_rsp_valid	)
        ,.eai_icb_rsp_ready	(eai_icb_rsp_ready	)
        ,.eai_icb_rsp_rdata	(eai_icb_rsp_rdata	)
        ,.eai_icb_rsp_err	(eai_icb_rsp_err	)
        ,.eai_mem_holdup	(eai_mem_holdup         )
);

rv_mcu u_rv_mcu(
         .eai_req_valid         (eai_req_valid          )
        ,.eai_req_ready         (eai_req_ready          )
        ,.eai_req_instr         (eai_req_instr          )
        ,.eai_req_rs1           (eai_req_rs1            )
        ,.eai_req_rs2           (eai_req_rs2            )
        ,.eai_req_itag          (eai_req_itag           )
        ,.eai_rsp_valid         (eai_rsp_valid          )
        ,.eai_rsp_ready         (eai_rsp_ready          )
        ,.eai_rsp_wdat          (eai_rsp_wdat           )
        ,.eai_rsp_itag          (eai_rsp_itag           )
        ,.eai_rsp_err           (eai_rsp_err            )
        ,.eai_icb_cmd_valid	(eai_icb_cmd_valid	)
        ,.eai_icb_cmd_ready	(eai_icb_cmd_ready	)
        ,.eai_icb_cmd_addr	(eai_icb_cmd_addr	)
        ,.eai_icb_cmd_read	(eai_icb_cmd_read	)
        ,.eai_icb_cmd_wdata	(eai_icb_cmd_wdata	)
        ,.eai_icb_cmd_wmask	(eai_icb_cmd_wmask	)
        ,.eai_icb_rsp_valid	(eai_icb_rsp_valid	)
        ,.eai_icb_rsp_ready	(eai_icb_rsp_ready	)
        ,.eai_icb_rsp_rdata	(eai_icb_rsp_rdata	)
        ,.eai_icb_rsp_err	(eai_icb_rsp_err	)
        ,.eai_mem_holdup	(eai_mem_holdup         )
        ,.clk                   (clk                    )
        ,.rst                   (mcu_rst                )
        ,.send_instr            (send_instr             )
        ,.instr                 (instr                  )
        ,.rs1_data              (rs1_data               )
        ,.rs2_data              (rs2_data               )
);

endmodule
