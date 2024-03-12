`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/22 14:39:07
// Design Name: 
// Module Name: flash_dri
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// (* mark_debug="true" *)
//////////////////////////////////////////////////////////////////////////////////

module flash_dri
(
    input   wire        clk,

    // SPI
    output  reg         fls_sck,
    output  reg         fls_ncs,
    output  reg         fls_sdo,
    input   wire        fls_sdi,

    // flash控制
    input   wire        start,
    input   wire [2:0]  mod_sel, // 多路选择指示

    // flash读写1byte
    input   wire [23:0] fls_addr,
    input   wire [7:0]  fls_write,
    output  wire [7:0]  fls_read,
    
    // flash快速读取
    output  wire        frd_en,
    output  wire [23:0] frd_addr,
    output  wire [7:0]  frd_data,

    // ID
    output  wire [15:0] id,
    output  reg         busy
);

// spi-sck
wire fls_sck_wen;
wire fls_sck_wfree;
wire fls_sck_erase;
wire fls_sck_sector;
wire fls_sck_wr;
wire fls_sck_rd;
wire fls_sck_frd;
wire fls_sck_id;

// spi-ncs
wire fls_ncs_wen;
wire fls_ncs_wfree;
wire fls_ncs_erase;
wire fls_ncs_sector;
wire fls_ncs_wr;
wire fls_ncs_rd;
wire fls_ncs_frd;
wire fls_ncs_id;

// spi-sdo
wire fls_sdo_wen;
wire fls_sdo_wfree;
wire fls_sdo_erase;
wire fls_sdo_sector;
wire fls_sdo_wr;
wire fls_sdo_rd;
wire fls_sdo_frd;
wire fls_sdo_id;

// spi-sdi
reg fls_sdi_wen;
reg fls_sdi_wfree;
reg fls_sdi_erase;
reg fls_sdi_sector;
reg fls_sdi_wr;
reg fls_sdi_rd;
reg fls_sdi_frd;
reg fls_sdi_id;

// start
reg start_wen;
reg start_wfree;
reg start_erase;
reg start_sector;
reg start_wr;
reg start_rd;
reg start_frd;
reg start_id;

// busy
wire busy_wen;
wire busy_wfree;
wire busy_erase;
wire busy_sector;
wire busy_wr;
wire busy_rd;
wire busy_frd;
wire busy_id;

/********************************** 功能模块 ******************************************/
// flash写使能
flash_write_enable u_flash_write_enable
(
    .clk        (clk            ),

    // SPI
    .fls_sck    (fls_sck_wen    ),
    .fls_ncs    (fls_ncs_wen    ),
    .fls_sdo    (fls_sdo_wen    ),
    .fls_sdi    (fls_sdi_wen    ),

    .start      (start_wen      ),
    .busy       (busy_wen       )
);

// 等待flash空闲
flash_wait_free u_flash_wait_free
(
    .clk        (clk            ),
    
    // SPI
    .fls_sck    (fls_sck_wfree  ),
    .fls_ncs    (fls_ncs_wfree  ),
    .fls_sdo    (fls_sdo_wfree  ),
    .fls_sdi    (fls_sdi_wfree  ),

    .start      (start_wfree    ),
    .busy       (busy_wfree     )
);

// 擦除整个flash
flash_erase u_flash_erase
(
    .clk        (clk            ),
    
    // SPI
    .fls_sck    (fls_sck_erase  ),
    .fls_ncs    (fls_ncs_erase  ),
    .fls_sdo    (fls_sdo_erase  ),
    .fls_sdi    (fls_sdi_erase  ),

    .start      (start_erase    ),
    .busy       (busy_erase     )
);

// 擦除flash一个扇区
flash_sector_erase u_flash_sector_erase
(
    .clk        (clk            ),
    
    // SPI
    .fls_sck    (fls_sck_sector ),
    .fls_ncs    (fls_ncs_sector ),
    .fls_sdo    (fls_sdo_sector ),
    .fls_sdi    (fls_sdi_sector ),

    // 擦除addr开始的一个扇区
    .start      (start_sector   ),
    .addr       (fls_addr       ),

    .busy       (busy_sector    )
);

// 写入数据到flash
flash_write u_flash_write
(
    .clk        (clk            ),

    // SPI
    .fls_sck    (fls_sck_wr     ),
    .fls_ncs    (fls_ncs_wr     ),
    .fls_sdo    (fls_sdo_wr     ),
    .fls_sdi    (fls_sdi_wr     ),

    // flash写入,每次写入1byte
    .start      (start_wr       ),
    .addr       (fls_addr       ),
    .din        (fls_write      ),

    .busy       (busy_wr        )
);

// 从flash读取数据
flash_read u_flash_read
(
    .clk        (clk            ),

    // SPI
    .fls_sck    (fls_sck_rd     ),
    .fls_ncs    (fls_ncs_rd     ),
    .fls_sdo    (fls_sdo_rd     ),
    .fls_sdi    (fls_sdi_rd     ),

    // 读数据,每次读取1byte
    .start      (start_rd       ),
    .addr       (fls_addr       ),
    .dout       (fls_read       ),

    .busy       (busy_rd        )
);

// 从flash读取数据(快速模式).
flash_fast_read u_flash_fast_read
(
    .clk        (clk            ),

    // SPI
    .fls_sck    (fls_sck_frd    ),
    .fls_ncs    (fls_ncs_frd    ),
    .fls_sdo    (fls_sdo_frd    ),
    .fls_sdi    (fls_sdi_frd    ),

    // 读数据,每次读取整个flash
    .start      (start_frd      ),
    .dout_en    (frd_en         ),
    .addr       (frd_addr       ),
    .dout       (frd_data       ),

    .busy       (busy_frd       )
);

/*************************************************
* 读取芯片ID
* 0xEF13,表示芯片型号为W25Q80
* 0xEF14,表示芯片型号为W25Q16
* 0xEF15,表示芯片型号为W25Q32
* 0xEF16,表示芯片型号为W25Q64
* 0xEF17,表示芯片型号为W25Q128
*************************************************/
flash_id u_flash_id
(
    .clk        (clk            ),
    
    // SPI
    .fls_sck    (fls_sck_id     ),
    .fls_ncs    (fls_ncs_id     ),
    .fls_sdo    (fls_sdo_id     ),
    .fls_sdi    (fls_sdi_id     ),

    .start      (start_id       ),
    .fls_id     (id             ),
    .busy       (busy_id        )
);

/********************************** 多路选择器 ********************************************/
// start
always@(posedge clk)
begin
    start_wfree  <= start && (mod_sel == 0);
    start_wen    <= start && (mod_sel == 1);
    start_erase  <= start && (mod_sel == 2);
    start_wr     <= start && (mod_sel == 3);
    start_rd     <= start && (mod_sel == 4);
    start_frd    <= start && (mod_sel == 5);
    start_id     <= start && (mod_sel == 6);
    start_sector <= start && (mod_sel == 7);
end

//spi-sdi
always@(posedge clk)
begin
    fls_sdi_wfree <= fls_sdi && (mod_sel == 0);
    fls_sdi_wen   <= fls_sdi && (mod_sel == 1);
    fls_sdi_erase <= fls_sdi && (mod_sel == 2);
    fls_sdi_wr    <= fls_sdi && (mod_sel == 3);
    fls_sdi_rd    <= fls_sdi && (mod_sel == 4);
    fls_sdi_frd   <= fls_sdi && (mod_sel == 5);
    fls_sdi_id    <= fls_sdi && (mod_sel == 6);
    fls_sdi_sector<= fls_sdi && (mod_sel == 7);
end

// spi-sck
always@(posedge clk)
begin
    case(mod_sel)
     0: fls_sck <= fls_sck_wfree;
     1: fls_sck <= fls_sck_wen;
     2: fls_sck <= fls_sck_erase;
     3: fls_sck <= fls_sck_wr;
     4: fls_sck <= fls_sck_rd;
     5: fls_sck <= fls_sck_frd;
     6: fls_sck <= fls_sck_id;
     7: fls_sck <= fls_sck_sector;
    endcase
end

// spi-ncs
always@(posedge clk)
begin
    case(mod_sel)
     0: fls_ncs <= fls_ncs_wfree;
     1: fls_ncs <= fls_ncs_wen;
     2: fls_ncs <= fls_ncs_erase;
     3: fls_ncs <= fls_ncs_wr;
     4: fls_ncs <= fls_ncs_rd;
     5: fls_ncs <= fls_ncs_frd;
     6: fls_ncs <= fls_ncs_id;
     7: fls_ncs <= fls_ncs_sector;
    endcase
end

// spi-sdo
always@(posedge clk)
begin
    case(mod_sel)
     0: fls_sdo <= fls_sdo_wfree;
     1: fls_sdo <= fls_sdo_wen;
     2: fls_sdo <= fls_sdo_erase;
     3: fls_sdo <= fls_sdo_wr;
     4: fls_sdo <= fls_sdo_rd;
     5: fls_sdo <= fls_sdo_frd;
     6: fls_sdo <= fls_sdo_id;
     7: fls_sdo <= fls_sdo_sector;
    endcase
end

// busy
always@(posedge clk)
begin
    busy <= busy_wfree | busy_wen | busy_erase | busy_wr | busy_rd | busy_frd | busy_id | busy_sector;
end

endmodule