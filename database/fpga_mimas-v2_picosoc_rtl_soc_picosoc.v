// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module picosoc(
    input clk,
    input resetn,
    
    output txd,
    input  rxd,

    output [7:0] led,

    output [7:0] ss,
    output [2:0] ssen,

    output       vga_h,
    output       vga_v,
    output [7:0] vga_pix
);

    wire trap;                  // CPU trap condition flag
    wire mem_valid;             // CPU memory valid flag
    wire mem_instr;
    reg  mem_ready;             // Synchronous memory valid flag
    wire [31:0] mem_addr;       // Current memory address
    wire [31:0] mem_wdata;      // Memory (BRAM or I/O) write buffer
    wire [ 3:0] mem_wstrb;      // Memory write strobe
    wire [31:0] mem_rdata;      // Memory (BRAM or I/O) read buffer
    
    /**
     * PicoRV32 RISC-V RV32I CPU Core
     */
    picorv32 #(.ENABLE_REGS_DUALPORT(0)) _picorv32(
        .clk       (clk      ),
        .resetn    (resetn   ),
        .trap      (trap     ),
        .mem_valid (mem_valid),
        .mem_instr (mem_instr),
        .mem_ready (mem_ready),
        .mem_addr  (mem_addr ),
        .mem_wdata (mem_wdata),
        .mem_wstrb (mem_wstrb),
        .mem_rdata (mem_rdata)
    );

    wire [31:0] ram_rdata;      // BRAM read buffer
    wire [31:0] io_rdata;       // I/O read buffer
    reg  [31:0] mem_addr1;      // Synchronous memory address buffer

    // Generate synchronous memory valid flag and address
    always @(posedge clk) begin
        mem_ready <= mem_valid;
        mem_addr1 <= mem_addr;
    end

    // Memory valid and address within memory mapped I/O range
    wire io_valid = mem_valid && (mem_addr[31]);

    // Inverted reset signal
    wire reset = ~resetn;

    /**
     * 8KB BRAM (4 x 2KB)
     */
    ram_2k_32 _ram_2k_32(
        clk,
        mem_addr[12:2],
        mem_wdata,
        ram_rdata,
        mem_wstrb,
        mem_valid && !mem_addr[31]
    );

    /**
     * Memory mapped I/O peripherals (e.g. UART, VGA)
     */
    io _io(
        clk,
        reset,
        io_valid,
        mem_addr[5:2],
        mem_wdata,
        mem_wstrb[0],
        io_rdata,
        led[6:0],
        rxd,
        txd,
        ss,
        ssen,
        vga_h,
        vga_v,
        vga_pix
    );

    // Read from memory mapped I/O if address MSB is set, else read from BRAM
    assign mem_rdata = mem_addr1[31] ? io_rdata : ram_rdata;

    // Indicate CPU trap condition (interrupt or exception) has occurred
    assign led[7] = trap;

endmodule


module io(
    input clk,
    input reset,
    input valid,
    input [3:0] addr,
    input [31:0] wdata,
    input wstrb,
    output reg [31:0] rdata,
    output reg [6:0] led,
    input rxd,
    output txd,
    output [7:0] ss,
    output [2:0] ssen,
    output       vga_h,
    output       vga_v,
    output [7:0] vga_pix
);

    // Peripheral Memory Map
    //
    // 80000000        out,    LED [0], write
    // 80000004        txd, data [7:0], write
    // 80000008        txd,  ready [0], read
    // 8000000C        rxd, data [7:0], read
    // 80000010        rxd,  ready [0], read
    // 80000014         ss,     [23:0], write
    // 80000018   vga_addr,      [7:0], write
    // 8000001C   vga_data,      [7:0], write
    // 80000020 vga_active,        [0], read

    wire led_write_strobe =        valid && (addr==4'd0) && wstrb;
    wire uart_tx_write_strobe =    valid && (addr==4'd1) && wstrb;
    wire uart_rx_read_strobe =     valid && (addr==4'd3) && !wstrb;
    wire ss_write_strobe =         valid && (addr==4'd5) && wstrb;
    wire vga_addr_write_strobe =   valid && (addr==4'd6) && wstrb;
    wire vga_data_write_strobe =   valid && (addr==4'd7) && wstrb;
    wire vga_active_strobe =       valid && (addr==4'd8) && !wstrb;

    wire uart_tx_ready;
    wire [7:0] uart_rx_data;
    wire uart_rx_ready;
    
    always @(posedge clk)
        case (addr)
            4'd2: rdata <= {31'd0, uart_tx_ready};
            4'd3: rdata <= {24'd0, uart_rx_data};
            4'd4: rdata <= {31'd0, uart_rx_ready};
            4'd5: rdata <= { 8'd0, reg_sevenseg_data};
            4'd8: rdata <= {31'd0, vga_active};
            default: rdata <= 32'd0;
        endcase

    wire baudclk16;

    uart_baud_clock_16x _uart_baud_clock_16x(clk, baudclk16);

    uart_tx _uart_tx(clk, reset, baudclk16, txd, wdata[7:0], uart_tx_ready, uart_tx_write_strobe);
    uart_rx _uart_rx(clk, reset, baudclk16, rxd, uart_rx_data, uart_rx_ready, uart_rx_read_strobe);

    // Seven Segment Display
    reg [23:0] reg_sevenseg_data;
    sevenseg _sevenseg(
        .clk   (clk              ),
        .data  (reg_sevenseg_data),
        .ss    (ss               ),
        .ssen  (ssen             )
    );

    // VGA
    wire pll_vga_locked;
    pll pll_vga(
        .clk_in   (clk           ),
        .clk_out  (clk_vga       ),
        .locked   (pll_vga_locked),
        .reset    (reset         )
    );

    wire vga_active;
    wire [12:0] vga_h_pos, vga_v_pos;
    vga_sync _vga_sync(
        .clk    (clk_vga   ),
        .hsync  (vga_h     ),
        .vsync  (vga_v     ),
        .active (vga_active),
        .h      (vga_h_pos ),
        .v      (vga_v_pos )
    );


    reg [15:0] vga_bram_waddr = 16'b0;
    reg [ 7:0] vga_bram_wdata =  8'b0;
    reg [15:0] vga_bram_raddr;
    wire[ 7:0] vga_bram_rdata;
    vga_bram _vga_bram(
        .clka  (clk                  ),
        .ena   (vga_data_write_strobe),
        .wea   (vga_data_write_strobe),
        .addra (vga_bram_waddr       ),
        .dina  (vga_bram_wdata       ),
        
        .clkb  (clk_vga              ),
        .addrb (vga_bram_raddr       ),
        .doutb (vga_bram_rdata       )
    );

    reg [7:0] vga_out;
    always @(posedge clk_vga) begin
        // Frame buffer 4:1 output
        vga_bram_raddr <= (vga_h_pos >> 2) + ((vga_v_pos >> 2) * 256);
        vga_out <= vga_bram_rdata;

        // Frame buffer 1:1 output
        /*
        if (vga_h_pos < 256 & vga_v_pos < 192) begin
            vga_bram_raddr <= vga_h_pos + (vga_v_pos * 256);
            vga_out <= vga_bram_rdata;
        end else begin
            vga_bram_raddr <= 16'h0000;
            vga_out <= 8'b00000000;
        end
        */
    end
    assign vga_pix = vga_active ? vga_out : 8'h00;


    always @(posedge clk) begin
        led[6] <= uart_tx_ready;
        led[5] <= uart_rx_ready;
        led[4] <= !txd;
        led[3] <= !rxd;
        
        if (led_write_strobe)
            led[2:0] <= wdata[2:0];
        
        if (ss_write_strobe)
            reg_sevenseg_data[23:0] <= wdata[23:0];
        
        if (vga_addr_write_strobe)
            vga_bram_waddr[15:0] <= wdata[15:0];
        
        if (vga_data_write_strobe)
            vga_bram_wdata[7:0] <= wdata[7:0];
    end

endmodule


module ram_2k_32(
    input clk,
    input [10:0] addr,
    input [31:0] din,
    output [31:0] dout,
    input [3:0] we,
    input en
);

    bram_2k_8 _bram0(clk, addr, din[7:0], dout[7:0], we[0], en);
    bram_2k_8 _bram1(clk, addr, din[15:8], dout[15:8], we[1], en);
    bram_2k_8 _bram2(clk, addr, din[23:16], dout[23:16], we[2], en);
    bram_2k_8 _bram3(clk, addr, din[31:24], dout[31:24], we[3], en);

endmodule


module bram_2k_8(
    input clk,
    input [10:0] addr,
    input [7:0] din,
    output [7:0] dout,
    input we,
    input en
);

    reg [7:0] mem[0:2047];
    reg [10:0] addr1;

    always @(posedge clk)
    if (en) begin
        addr1 <= addr;
        if (we)
        mem[addr] <= din;
    end      

    assign dout = mem[addr1];

endmodule


module uart_baud_clock_16x(
    input clk,
    output baudclk16
);

    reg [8:0] c;
    wire m = (c==9'd325);    // 100e6 / (16 * 19200) ~= 326

    always @(posedge clk)
    c <= m ? 0 : c+1;

    assign baudclk16 = m;

endmodule
