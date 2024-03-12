module top
(
    input   wire        sclk,
    
    input   wire        key,
    
    // UART
    input   wire        rxd,
    output  wire        txd,
    
    // FLASH
    output  wire        flash_sck,
    output  wire        flash_cs,
    output  wire        flash_sdo,
    input   wire        flash_sdi,
    
    // tube
    output  wire [7:0]  tube,
    output  wire [3:0]  tube_sel,
    
    // LED
    output  wire[15:0]  led
);

/*
* mod_sel == 0: 等待flash空闲
* mod_sel == 1: flash写使能
* mod_sel == 2: 擦除整个flash
* mod_sel == 3: 写入数据(1byte)到flash
* mod_sel == 4: 从flash读取数据(1byte)
* mod_sel == 5: 读取整个flash.
* mod_sel == 6: 读取芯片ID
* mod_sel == 7: 擦除flash一个扇区
*/

wire start;
wire [2:0] mod_sel;
wire [23:0] fls_addr;
wire [7:0] fls_write;
wire [7:0] fls_read;
wire frd_en;
wire [23:0] frd_addr;
wire [7:0] frd_data;
wire [15:0] id;
wire busy;

wire [3:0] sm_bit1_num ;
wire [3:0] sm_bit2_num ;
wire [3:0] sm_bit3_num ;
wire [3:0] sm_bit4_num ;

uart
#(
    .BAUDRATE(115200        ),
    .CLK_RATE(24000000      ) // Hz
)
u_uart
(
    .clk        (sclk       ),

    // uart
    .rx         (rxd        ),
    .tx         (txd        ),
    
    // tube 
    .sm_bit1    (sm_bit1_num),
    .sm_bit2    (sm_bit2_num),
    .sm_bit3    (sm_bit3_num),
    .sm_bit4    (sm_bit4_num),
	
    // led
    .led        (led        ),
    
	// flash
    .start      (start      ),
    .mod_sel    (mod_sel    ),
    .fls_addr   (fls_addr   ),
    .fls_write  (fls_write  ),
    .fls_read   (fls_read   ),
    .id         (id         ),
    .busy       (busy       )
);

flash_dri u_flash_dri
(
    .clk        (sclk       ),

    // SPI
    .fls_sck    (flash_sck  ),
    .fls_ncs    (flash_cs   ),
    .fls_sdo    (flash_sdo  ),
    .fls_sdi    (flash_sdi  ),

    // flash控制
    .start      (start      ),
    .mod_sel    (mod_sel    ), // 多路选择指示

    // flash读写1byte
    .fls_addr   (fls_addr   ),
    .fls_write  (fls_write  ),
    .fls_read   (fls_read   ),
    
    // flash快速读取
    .frd_en     (frd_en     ),
    .frd_addr   (frd_addr   ),
    .frd_data   (frd_data   ),

    // ID
    .id         (id         ),
    .busy       (busy       )
);

// 动态数码管
tube_dri u_tube_dri
( 
    .clk_24m        (sclk       ),
                                
    .sm_seg         (tube       ),
    .sm_bit         (tube_sel   ),
                                
    .sm_bit1_num    (sm_bit1_num),
    .sm_bit2_num    (sm_bit2_num),
    .sm_bit3_num    (sm_bit3_num),
    .sm_bit4_num    (sm_bit4_num)
);

endmodule
