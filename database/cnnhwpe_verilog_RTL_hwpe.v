// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  hwpe.v
// Module  name  :  hwpe
// Created Time  :  2018/5/17 9:43:47
// Last Modified :  2018/5/25 11:53:46
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/17  chenhaoc
//
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module hwpe(
    input  wire                         clk,
    //=================   D M A   ====================
    input  wire                         dma_wen,
    input  wire  [`HWPE_ADDR_WIDTH-1:0] dma_wa,
    input  wire  [63:0]                 dma_wd,

    //=================   E A I   ====================
    //request channel
    input  wire          eai_req_valid,
    output wire          eai_req_ready,
    input  wire [31:0]   eai_req_instr,
    input  wire [31:0]   eai_req_rs1,
    input  wire [31:0]   eai_req_rs2,
    input  wire [1:0]    eai_req_itag,

    //response channel
    output wire          eai_rsp_valid,
    input  wire          eai_rsp_ready,
    output wire [31:0]   eai_rsp_wdat,
    output wire [1:0]    eai_rsp_itag,
    output wire          eai_rsp_err,

    //memory request channel
    output wire          eai_icb_cmd_valid,
    input  wire          eai_icb_cmd_ready,
    output wire [31:0]   eai_icb_cmd_addr,
    output wire          eai_icb_cmd_read,
    output wire [31:0]   eai_icb_cmd_wdata,
    output wire [3:0]    eai_icb_cmd_wmask,

    //memory response channel
    input  wire          eai_icb_rsp_valid,
    output wire          eai_icb_rsp_ready,
    input  wire [31:0]   eai_icb_rsp_rdata,
    input  wire          eai_icb_rsp_err,
    //memory holdup
    output wire          eai_mem_holdup

);

wire          rst;
wire  [31:0]  instr;
wire  [31:0]  rs1_data;
wire  [31:0]  rs2_data;
wire          acc_ren;
wire  [31:0]  acc_r_rd;
wire          relu_ren;
wire  [31:0]  relu_out_32b;
wire          relu_out_continue;
wire          relu_done;
wire          relu_accreg_en;
wire          hwpe_conv_st;
wire          matrixmac_st;
wire          fmap_2addr_error;
wire          kernel_2addr_error;
wire          relu_ren_st;
wire          pe_done;
wire          hwpe_conv_en_error;
wire          instr_reset;
wire          fmap_write_read_error;
wire          kernel_write_read_error;

eai_itf  u_eai_itf(
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
        ,.rst                   (rst                    )
        ,.instr                 (instr                  )
        ,.rs1_data              (rs1_data               )
        ,.rs2_data              (rs2_data               )
        ,.acc_ren               (acc_ren                )
        ,.acc_r_rd              (acc_r_rd               )
        ,.relu_ren              (relu_ren               )
        ,.relu_ren_st           (relu_ren_st            )
        ,.relu_out_32b          (relu_out_32b           )
        ,.relu_out_continue	(relu_out_continue	)
        ,.relu_done             (relu_done              )
        ,.relu_accreg_en	(relu_accreg_en         )
        ,.hwpe_conv_st          (hwpe_conv_st           )
        ,.matrixmac_st          (matrixmac_st           )
        ,.fmap_2addr_error      (fmap_2addr_error       )
        ,.kernel_2addr_error    (kernel_2addr_error     )
        ,.pe_done               (pe_done                )
        ,.hwpe_conv_en_error    (hwpe_conv_en_error     )
        ,.instr_reset           (instr_reset            )
        ,.done_imm              (done_imm               )
        ,.fmap_write_read_error (fmap_write_read_error  )
        ,.kernel_write_read_error(kernel_write_read_error)
);

wire          write_fmap_addrreg;
wire          write_cfgreg;
// wire          matrixmac_en;
wire  [4:0]   rs1;
wire  [4:0]   rs2;
wire  [4:0]   rd;
wire          fmap_matrixmac_st;
wire          kernel_matrixmac_st;
wire          acc_wen;
wire  [2:0]   acc_w_acc_id;
wire  [3:0]   acc_w_pe_id;
wire  [31:0]  acc_w_wd;
// wire          acc_ren;
wire  [2:0]   acc_r_acc_id;
wire  [3:0]   acc_r_pe_id;
// wire          relu_ren;
wire  [2:0]   relu_acc_id;
wire          Layer_type;
wire          Kernel_333;
wire          matrix_done;
wire          matrixmac_en;

instr_de  u_instr_de(
         .instr                 (instr          )
        ,.rs1_data              (rs1_data       )
        ,.rs2_data              (rs2_data       )
        ,.clk                   (clk            )
        ,.rst                   (rst    	)
        ,.write_fmap_addrreg    (write_fmap_addrreg  )
        ,.write_cfgreg          (write_cfgreg	)
        ,.matrixmac_en          (matrixmac_en	)
        ,.rs1                   (rs1    	)
        ,.rs2                   (rs2    	)
        ,.rd                    (rd     	)
        ,.Layer_type	        (Layer_type	)
        ,.Kernel_333	        (Kernel_333	)
        ,.fmap_matrixmac_st     (fmap_matrixmac_st   )
        ,.kernel_matrixmac_st   (kernel_matrixmac_st )
        ,.hwpe_conv_st          (hwpe_conv_st	)
        ,.acc_wen               (acc_wen	)
        ,.acc_w_acc_id          (acc_w_acc_id	)
        ,.acc_w_pe_id           (acc_w_pe_id	)
        ,.acc_w_wd              (acc_w_wd	)
        ,.acc_ren               (acc_ren	)
        ,.acc_r_acc_id          (acc_r_acc_id	)
        ,.acc_r_pe_id           (acc_r_pe_id	)
        ,.relu_ren              (relu_ren	)
        ,.relu_acc_id           (relu_acc_id	)
        ,.matrixmac_st          (matrixmac_st   )
        ,.relu_ren_st           (relu_ren_st    )
        ,.matrix_done           (matrix_done    )
        ,.hwpe_conv_en_error    (hwpe_conv_en_error)
        ,.instr_reset           (instr_reset    )
        ,.eai_req_valid         (eai_req_valid  )
        ,.eai_req_ready         (eai_req_ready  )
        ,.done_imm              (done_imm               )
);

wire  [15:0]  Conv_W_offset;
wire  [15:0]  Conv_CH_count;
wire  [3:0]   Kernel_size;
wire  [1:0]   Data_type;

wire  [4:0]   AccReg_shift;
wire  [9:0]   K_count;
wire  [15:0]  W_count;
wire  [15:0]  H_count;
wire  [15:0]  W_stride;
wire  [15:0]  H_stride;
wire  [2:0]   baseaddr_ra1;
wire  [2:0]   baseaddr_ra2;
wire  [`FMEM_ADDR_WIDTH-1:0] baseaddr_rd1;
wire  [`FMEM_ADDR_WIDTH-1:0] baseaddr_rd2;


regcfg    u_regcfg(
         .clk                    (clk           )
        ,.write_fmap_addrreg     (write_fmap_addrreg	)
        ,.write_cfgreg	         (write_cfgreg	)
        ,.matrixmac_st	         (matrixmac_st	)
        ,.rs1          	         (rs1    	)
        ,.rs2       	         (rs2    	)
        ,.rd        	         (rd     	)
        ,.rs1_data  	         (rs1_data	)
        ,.rs2_data  	         (rs2_data	)
        ,.Conv_W_offset	         (Conv_W_offset	)
        ,.Conv_CH_count	         (Conv_CH_count	)
        ,.Kernel_size	         (Kernel_size	)
        ,.Data_type 	         (Data_type	)
        ,.Layer_type	         (Layer_type	)
        ,.Kernel_333	         (Kernel_333	)
        ,.AccReg_shift	         (AccReg_shift	)
        ,.K_count   	         (K_count	)
        ,.W_count   	         (W_count	)
        ,.H_count   	         (H_count	)
        ,.W_stride  	         (W_stride	)
        ,.H_stride  	         (H_stride	)
        ,.baseaddr_ra1	         (baseaddr_ra1	)
        ,.baseaddr_ra2	         (baseaddr_ra2	)
        ,.baseaddr_rd1	         (baseaddr_rd1	)
        ,.baseaddr_rd2	         (baseaddr_rd2	)
);

wire  [`FMEM_ADDR_WIDTH-1:0] fmap_ra1;
wire  [`FMEM_ADDR_WIDTH-1:0] fmap_ra2;
wire  [63:0]  fmap_rd1;
wire  [63:0]  fmap_rd2;
wire          fmap_ren1;
wire          fmap_ren2;
wire  [127:0] fifo0_wd;
wire          fifo0_wen;
wire          fifo_w2entry;
wire  [127:0] fifo1_wd;
wire          fifo1_wen;

data_fetcher  u_data_fetcher(
         .clk   	        (clk                )
        ,.rst   	        (rst                )
        ,.matrixmac_st	        (fmap_matrixmac_st  )
        ,.hwpe_conv_st	        (hwpe_conv_st       )
        ,.Conv_W_offset	        (Conv_W_offset      )
        ,.Conv_CH_count	        (Conv_CH_count      )
        ,.Kernel_size	        (Kernel_size        )
        ,.Layer_type	        (Layer_type         )
        ,.Kernel_333	        (Kernel_333         )
        ,.K_count	        (K_count            )
        ,.W_count	        (W_count            )
        ,.H_count	        (H_count            )
        ,.W_stride	        (W_stride           )
        ,.H_stride	        (H_stride           )
        ,.baseaddr_rd1	        (baseaddr_rd1       )
        ,.baseaddr_rd2	        (baseaddr_rd2       )
        ,.baseaddr_ra1	        (baseaddr_ra1       )
        ,.baseaddr_ra2	        (baseaddr_ra2       )
        ,.fmap_rd1	        (fmap_rd1           )
        ,.fmap_rd2	        (fmap_rd2           )
        ,.fmap_ra1	        (fmap_ra1           )
        ,.fmap_ra2	        (fmap_ra2           )
        ,.fmap_ren1	        (fmap_ren1          )
        ,.fmap_ren2	        (fmap_ren2          )
        ,.fifo0_wd	        (fifo0_wd           )
        ,.fifo0_wen	        (fifo0_wen          )
        ,.fifo_w2entry	        (fifo_w2entry       )
        ,.fifo1_wd	        (fifo1_wd           )
        ,.fifo1_wen	        (fifo1_wen          )
        ,.matrix_done           (matrix_done        )
);


wire fmap_wen;
wire [`FMEM_ADDR_WIDTH-1:0] fmap_wa;
wire [63:0] fmap_wd;
assign fmap_wen = dma_wen & ~dma_wa[`HWPE_ADDR_WIDTH-1];
assign fmap_wa = dma_wa[`FMEM_ADDR_WIDTH-1:0];
assign fmap_wd = dma_wd;

fmap_sram      u_fmap_sram(
         .clk                   (clk                )
        ,.ren1                  (fmap_ren1          )
        ,.ra1                   (fmap_ra1           )
        ,.ren2                  (fmap_ren2          )
        ,.ra2                   (fmap_ra2           )
        ,.wa                    (fmap_wa            )
        ,.wd                    (fmap_wd            )
        ,.wen                   (fmap_wen           )
        ,.rd1                   (fmap_rd1           )
        ,.rd2                   (fmap_rd2           )
        ,.fmap_2addr_error      (fmap_2addr_error   )
        ,.fmap_write_read_error (fmap_write_read_error)
);

wire  [`KMEM_ADDR_WIDTH-1:0] kernel_ra1;
wire  [`KMEM_ADDR_WIDTH-1:0] kernel_ra2;
wire  [63:0]      kernel_rd1;
wire  [63:0]      kernel_rd2;
wire              kernel_ren1;
wire              kernel_ren2;
wire              fifo_empty;
wire [64*16-1:0]  rm;

kernel_fetcher  u_kernel_fetcher(
         .clk                   (clk                )
        ,.rst                   (rst                )
        ,.matrixmac_st          (kernel_matrixmac_st)
        ,.Kernel_333            (Kernel_333         )
        ,.Kernel_size           (Kernel_size        )
        ,.Conv_CH_count         (Conv_CH_count      )
        ,.K_count               (K_count            )
        ,.W_count               (W_count            )
        ,.H_count               (H_count            )
        ,.kernel_rd1            (kernel_rd1         )
        ,.kernel_rd2            (kernel_rd2         )
        ,.kernel_ra1            (kernel_ra1         )
        ,.kernel_ra2            (kernel_ra2         )
        ,.kernel_ren1           (kernel_ren1        )
        ,.kernel_ren2           (kernel_ren2        )
        ,.fifo_empty            (fifo_empty         )
        ,.rm                    (rm                 )
);



wire kernel_wen;
wire [`KMEM_ADDR_WIDTH-1:0] kernel_wa;
wire [63:0] kernel_wd;
assign kernel_wen = dma_wen & dma_wa[`HWPE_ADDR_WIDTH-1];
assign kernel_wa = dma_wa[`KMEM_ADDR_WIDTH-1:0];
assign kernel_wd = dma_wd;

kernel_sram      u_kernel_sram(
         .clk                   (clk                  )
        ,.ren1                  (kernel_ren1          )
        ,.ra1                   (kernel_ra1           )
        ,.ren2                  (kernel_ren2          )
        ,.ra2                   (kernel_ra2           )
        ,.wa                    (kernel_wa            )
        ,.wd                    (kernel_wd            )
        ,.wen                   (kernel_wen           )
        ,.rd1                   (kernel_rd1           )
        ,.rd2                   (kernel_rd2           )
        ,.kernel_2addr_error    (kernel_2addr_error   )
        ,.kernel_write_read_error(kernel_write_read_error)
);

wire         fifo_ren;
wire [63:0]  fifo_rd;

fifo_odd_even    u_fifo_odd_even(
         .clk                   (clk            )
        ,.rst                   (rst            )
        ,.fifo_w2entry          (fifo_w2entry	)
        ,.fifo0_wd              (fifo0_wd	)
        ,.fifo1_wd              (fifo1_wd	)
        ,.fifo0_wen             (fifo0_wen	)
        ,.fifo1_wen             (fifo1_wen	)
        ,.fifo_ren              (fifo_ren	)
        ,.fifo_rd               (fifo_rd	)
        ,.fifo_empty            (fifo_empty	)
);




wire [63:0] lm;
wire        mac_out_en;
wire [2:0]  mac_acc_id;
pe_ctrl u_pe_ctrl        (
     .clk                (clk               )
    ,.rst                (rst               )
    ,.fifo_empty         (fifo_empty        )
    ,.fifo_rd            (fifo_rd           )
    ,.fifo_ren           (fifo_ren          )
    ,.lm                 (lm                )
    ,.mac_out_en         (mac_out_en        )
    ,.mac_acc_id         (mac_acc_id        )
    ,.pe_done            (pe_done           )
    ,.fmap_2addr_error   (fmap_2addr_error  )
    ,.kernel_2addr_error (kernel_2addr_error)
);


wire [319:0]     mul_out_dat;
pe_mul u_pe_mul(
     .clk        (clk           )
    ,.rst        (rst           )
    ,.Data_type  (Data_type     )
    ,.lm         (lm            )
    ,.rm         (rm            )
    ,.mul_out_dat(mul_out_dat   )
);

wire  [31:0]     relu_accreg_0;
wire  [31:0]     relu_accreg_1;
wire  [31:0]     relu_accreg_2;
wire  [31:0]     relu_accreg_3;

accreg u_accreg(
     .clk	        (clk	        )
    ,.rst	        (rst	        )
    ,.wen	        (acc_wen	        )
    ,.w_acc_id	        (acc_w_acc_id	)
    ,.w_pe_id	        (acc_w_pe_id	)
    ,.w_wd	        (acc_w_wd	)
    ,.ren	        (acc_ren        )
    ,.r_acc_id	        (acc_r_acc_id	)
    ,.r_pe_id	        (acc_r_pe_id	)
    ,.r_rd	        (acc_r_rd       )
    ,.mac_out_en	(mac_out_en	)
    ,.mac_acc_id	(mac_acc_id	)
    ,.mul_out_dat	(mul_out_dat	)
    ,.relu_ren	        (relu_ren	)
    ,.relu_ren_st       (relu_ren_st	)
    ,.relu_acc_id	(relu_acc_id	)
    ,.relu_accreg_0	(relu_accreg_0	)
    ,.relu_accreg_1	(relu_accreg_1	)
    ,.relu_accreg_2	(relu_accreg_2	)
    ,.relu_accreg_3	(relu_accreg_3	)
    ,.relu_accreg_en	(relu_accreg_en	)
    ,.relu_out_continue (relu_out_continue)
    ,.relu_done         (relu_done      )
    ,.eai_rsp_valid     (eai_rsp_valid  )
    ,.eai_rsp_ready     (eai_rsp_ready  )
);

relu_acc  u_relu_acc(
         .clk                   (clk            )
        ,.rst                   (rst            )
        ,.AccReg_shift          (AccReg_shift	)
        ,.relu_accreg_0         (relu_accreg_0	)
        ,.relu_accreg_1         (relu_accreg_1	)
        ,.relu_accreg_2         (relu_accreg_2	)
        ,.relu_accreg_3         (relu_accreg_3	)
        ,.relu_out_continue     (relu_out_continue)
        ,.relu_out_32b          (relu_out_32b	)
);

endmodule
