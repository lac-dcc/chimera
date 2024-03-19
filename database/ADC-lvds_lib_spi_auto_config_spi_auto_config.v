module spi_auto_config(

    input             clk,
    input             resetn,
    // for simulate
    output     [15:0] ocfg_cur_state

    ,input            spi_miso_i
    ,output           spi_clk_o
    ,output           spi_mosi_o
    ,output [31:0]    spi_cs_o
    ,output           spi_tri_o
    
    ,output           cfg_finish_o
    
    ,output [ 31:0]  ram_inputs_o
    ,input  [ 31:0]  ram_outputs_i
    ,input  [ 31:0]  ram_addr_i
    ,input  [  3:0]  ram_wea_i
);




// End of xpm_memory_spram instance declaration
  localparam NUM_OF_CS = 1;
  localparam DEFAULT_SPI_CFG = 0;
  localparam DEFAULT_CLK_DIV = 10;
  localparam DATA_WIDTH = 8;
  localparam NUM_OF_SDI = 1;
  localparam [0:0] SDO_DEFAULT = 1'b0;
  localparam ECHO_SCLK = 0;
  localparam [1:0] SDI_DELAY = 2'b00;

localparam CMD_TRANSFER = 2'b00;
localparam CMD_CHIPSELECT = 2'b01;
localparam CMD_WRITE = 2'b10;
localparam CMD_MISC = 2'b11;

localparam MISC_SYNC = 1'b0;
localparam MISC_SLEEP = 1'b1;

localparam REG_CLK_DIV = 2'b00;
localparam REG_CONFIG = 2'b01;
localparam REG_WORD_LENGTH = 2'b10;

  wire        active;
  wire        sync_valid;
  wire [7:0]  sync;

  reg  [15:0] s_axis_cmd_tdata;
  reg         s_axis_cmd_tvalid;
  wire        s_axis_cmd_tready;

  reg   [7:0] s_axis_sdo_tdata;
  reg         s_axis_sdo_tvalid;
  wire        s_axis_sdo_tready;

  wire  [7:0] m_axis_sdi_tdata;
  wire        m_axis_sdi_tvalid;
  reg         m_axis_sdi_tready;

  wire [15:0] m_axis_cmd_tdata;
  wire        m_axis_cmd_tvalid;
  wire        m_axis_cmd_tready;

  wire  [7:0] m_axis_sdo_tdata;
  wire        m_axis_sdo_tvalid;
  wire        m_axis_sdo_tready;

  wire  [7:0] s_axis_sdi_tdata;
  wire        s_axis_sdi_tvalid;
  wire        s_axis_sdi_tready;

  reg  [31:0] spi_cs_int;
  wire        spi_tri_int;
  
  assign spi_tri_o = spi_tri_int;
  assign spi_cs_o = spi_cs_int;

    spi_engine_execution #(
        .NUM_OF_CS(NUM_OF_CS),
        .DEFAULT_SPI_CFG(DEFAULT_SPI_CFG),
        .DEFAULT_CLK_DIV(DEFAULT_CLK_DIV),
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_OF_SDI(NUM_OF_SDI),
        .SDO_DEFAULT(SDO_DEFAULT),
        .ECHO_SCLK(ECHO_SCLK),
        .SDI_DELAY(SDI_DELAY)
    ) inst_spi_engine_execution (
        .clk            (clk   ),
        .resetn         (resetn),
        .active         (active),
        
        .cmd_ready      (m_axis_cmd_tready),
        .cmd_valid      (m_axis_cmd_tvalid),
        .cmd            (m_axis_cmd_tdata ),
        
        .sdo_data_valid (m_axis_sdo_tvalid),
        .sdo_data_ready (m_axis_sdo_tready),
        .sdo_data       (m_axis_sdo_tdata ),
        
        .sdi_data_ready (s_axis_sdi_tready),
        .sdi_data_valid (s_axis_sdi_tvalid),
        .sdi_data       (s_axis_sdi_tdata ),
        
        .sync_ready     (sync_ready),
        .sync_valid     (sync_valid),
        .sync           (sync      ),
        
        .echo_sclk      (echo_sclk ),

        .sclk           (spi_clk_o ),
        .sdo            (spi_mosi_o),
        .sdo_t          (spi_tri_int ),
        .sdi            (spi_miso_i),
        .cs             (          ),
        .three_wire     (          )
    );

    axis_fifo #(
            .DEPTH(256),
            .DATA_WIDTH(16),
            .KEEP_ENABLE(0),
            .KEEP_WIDTH(1),
            .LAST_ENABLE(0),
            .ID_ENABLE(0),
            .ID_WIDTH(1),
            .DEST_ENABLE(0),
            .DEST_WIDTH(1),
            .USER_ENABLE(0),
            .USER_WIDTH(1),
            .FRAME_FIFO(0),
            .USER_BAD_FRAME_VALUE(1),
            .USER_BAD_FRAME_MASK(1),
            .DROP_BAD_FRAME(0),
            .DROP_WHEN_FULL(0)
        ) inst_cmd_axis_fifo (
            .clk               (clk    ),
            .rst               (~resetn),

            .s_axis_tdata      (s_axis_cmd_tdata),
            .s_axis_tvalid     (s_axis_cmd_tvalid),
            .s_axis_tready     (s_axis_cmd_tready),

            .m_axis_tdata      (m_axis_cmd_tdata),
            .m_axis_tvalid     (m_axis_cmd_tvalid),
            .m_axis_tready     (m_axis_cmd_tready)
        );

    axis_fifo #(
        .DEPTH(256),
        .DATA_WIDTH(8),
        .KEEP_ENABLE(0),
        .KEEP_WIDTH(1),
        .LAST_ENABLE(0),
        .ID_ENABLE(0),
        .ID_WIDTH(1),
        .DEST_ENABLE(0),
        .DEST_WIDTH(1),
        .USER_ENABLE(0),
        .USER_WIDTH(1),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1),
        .USER_BAD_FRAME_MASK(1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    ) inst_sdo_axis_fifo (
        .clk               (clk    ),
        .rst               (~resetn),

        .s_axis_tdata      (s_axis_sdo_tdata),
        .s_axis_tvalid     (s_axis_sdo_tvalid),
        .s_axis_tready     (s_axis_sdo_tready),

        .m_axis_tdata      (m_axis_sdo_tdata),
        .m_axis_tvalid     (m_axis_sdo_tvalid),
        .m_axis_tready     (m_axis_sdo_tready)
    );
        
    axis_fifo #(
        .DEPTH(256),
        .DATA_WIDTH(8),
        .KEEP_ENABLE(0),
        .KEEP_WIDTH(1),
        .LAST_ENABLE(0),
        .ID_ENABLE(0),
        .ID_WIDTH(1),
        .DEST_ENABLE(0),
        .DEST_WIDTH(1),
        .USER_ENABLE(0),
        .USER_WIDTH(1),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1),
        .USER_BAD_FRAME_MASK(1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    ) inst_sdi_axis_fifo (
        .clk               (clk    ),
        .rst               (~resetn),

        .s_axis_tdata      (s_axis_sdi_tdata),
        .s_axis_tvalid     (s_axis_sdi_tvalid),
        .s_axis_tready     (s_axis_sdi_tready),

        .m_axis_tdata      (m_axis_sdi_tdata),
        .m_axis_tvalid     (m_axis_sdi_tvalid),
        .m_axis_tready     (m_axis_sdi_tready)
    );

    reg    [15:0]       rcfg_cur_state;
    reg    [31:0]       r_cfg_rdata   ;
    reg    [31:0]       r_timer       ;

    reg    [31:0]       r_cnt         ;

    reg    [31:0]       r_spi_reg;
    
    wire   [31:0]       w_lmk04828Reg_1;
    wire   [31:0]       w_lmk04828Reg_2;
    
    wire   [3:0]        wea_0 = (ram_addr_i[7] == 1'b0) ? ram_wea_i : 4'b0000;
    wire   [3:0]        wea_1 = (ram_addr_i[7] == 1'b1) ? ram_wea_i : 4'b0000;
    wire   [6:0]        addra = ram_addr_i[6:0];
    wire   [31:0]       dina = ram_outputs_i;
    
    assign  ram_inputs_o = (ram_addr_i[7] == 1'b0) ? w_lmk04828Reg_1 : w_lmk04828Reg_2;
    
xpm_memory_sdpram # (
      // Common module parameters
    .MEMORY_SIZE             (4096),            //positive integer
    .MEMORY_PRIMITIVE        ("block"),          //string; "auto", "distributed", "block" or "ultra";
    .CLOCKING_MODE           ("common_clock"),  //string; "common_clock", "independent_clock" 
    .MEMORY_INIT_FILE        ("lmk04828init.mem"),          //string; "none" or "<filename>.mem" 
    .MEMORY_INIT_PARAM       (""    ),          //string;
    .USE_MEM_INIT            (1),               //integer; 0,1
    .WAKEUP_TIME             ("disable_sleep"), //string; "disable_sleep" or "use_sleep_pin" 
    .MESSAGE_CONTROL         (0),               //integer; 0,1
    .ECC_MODE                ("no_ecc"),        //string; "no_ecc", "encode_only", "decode_only" or "both_encode_and_decode" 
    .AUTO_SLEEP_TIME         (0),               //Do not Change
    .USE_EMBEDDED_CONSTRAINT (0),               //integer: 0,1
    .MEMORY_OPTIMIZATION     ("true"),          //string; "true", "false" 
    
    // Port A module parameters
    .WRITE_DATA_WIDTH_A      (32),              //positive integer
    .BYTE_WRITE_WIDTH_A      (8),              //integer; 8, 9, or WRITE_DATA_WIDTH_A value
    .ADDR_WIDTH_A            (7),               //positive integer
    
    // Port B module parameters
    .READ_DATA_WIDTH_B       (32),              //positive integer
    .ADDR_WIDTH_B            (7),               //positive integer
    .READ_RESET_VALUE_B      ("0"),             //string
    .READ_LATENCY_B          (1),               //non-negative integer
    .WRITE_MODE_B            ("no_change")      //string; "write_first", "read_first", "no_change" 
) xpm_memory_spram_inst_0 (
	// Common module ports

	.sleep (1'b0),
	// Port A module ports
    .clka                    (clk),
    .ena                     (1'b1),
    .wea                     (wea_0),
    .addra                   (addra),
    .dina                    (dina),
    .injectsbiterra          (1'b0),
    .injectdbiterra          (1'b0),
  
    // Port B module ports
    .clkb                    (clk),
    .rstb                    (~resetn),
    .enb                     (1'b1),
    .regceb                  (1'b1),
    .addrb                   (r_timer[6:0]),
    .doutb                   (w_lmk04828Reg_1),
    .sbiterrb                (),
    .dbiterrb                ()
);
xpm_memory_sdpram # (
      // Common module parameters
    .MEMORY_SIZE             (4096),            //positive integer
    .MEMORY_PRIMITIVE        ("block"),          //string; "auto", "distributed", "block" or "ultra";
    .CLOCKING_MODE           ("common_clock"),  //string; "common_clock", "independent_clock" 
    .MEMORY_INIT_FILE        ("lmk04828init_1.mem"),          //string; "none" or "<filename>.mem" 
    .MEMORY_INIT_PARAM       (""    ),          //string;
    .USE_MEM_INIT            (1),               //integer; 0,1
    .WAKEUP_TIME             ("disable_sleep"), //string; "disable_sleep" or "use_sleep_pin" 
    .MESSAGE_CONTROL         (0),               //integer; 0,1
    .ECC_MODE                ("no_ecc"),        //string; "no_ecc", "encode_only", "decode_only" or "both_encode_and_decode" 
    .AUTO_SLEEP_TIME         (0),               //Do not Change
    .USE_EMBEDDED_CONSTRAINT (0),               //integer: 0,1
    .MEMORY_OPTIMIZATION     ("true"),          //string; "true", "false" 
    
    // Port A module parameters
    .WRITE_DATA_WIDTH_A      (32),              //positive integer
    .BYTE_WRITE_WIDTH_A      (8),              //integer; 8, 9, or WRITE_DATA_WIDTH_A value
    .ADDR_WIDTH_A            (7),               //positive integer
    
    // Port B module parameters
    .READ_DATA_WIDTH_B       (32),              //positive integer
    .ADDR_WIDTH_B            (7),               //positive integer
    .READ_RESET_VALUE_B      ("0"),             //string
    .READ_LATENCY_B          (1),               //non-negative integer
    .WRITE_MODE_B            ("no_change")      //string; "write_first", "read_first", "no_change" 
) xpm_memory_spram_inst_1 (
	// Common module ports

	.sleep (1'b0),
	// Port A module ports
    .clka                    (clk),
    .ena                     (1'b1),
    .wea                     (wea_1),
    .addra                   (addra),
    .dina                    (dina),
    .injectsbiterra          (1'b0),
    .injectdbiterra          (1'b0),
  
    // Port B module ports
    .clkb                    (clk),
    .rstb                    (~resetn),
    .enb                     (1'b1),
    .regceb                  (1'b1),
    .addrb                   (r_timer[6:0]),
    .doutb                   (w_lmk04828Reg_2),
    .sbiterrb                (),
    .dbiterrb                ()

	
);
//ila_0 ila_0 
//(
//.clk(clk),
//.probe0(s_axis_cmd_tvalid),
//.probe1(s_axis_cmd_tdata),
//.probe2(s_axis_sdo_tvalid),
//.probe3(s_axis_sdo_tdata),
//.probe4(r_timer),
//.probe5(spi_cs_int),
//.probe6(spi_mosi_o),
//.probe7(spi_miso_i),
//.probe8(spi_tri_o),
//.probe9(rcfg_cur_state)
//);
localparam lmk04828_regs_all = 32'd136;
localparam ad9680_regs_all   = 32'd9;
localparam adl5205_regs_all   = 32'd1;
localparam regs_all          = lmk04828_regs_all + ad9680_regs_all + adl5205_regs_all;

    always @ (posedge clk) begin
        if(!resetn) begin
            rcfg_cur_state    <= 15'd0;

            s_axis_cmd_tvalid <= 1'b0;
            s_axis_cmd_tdata  <= 16'd0;

            s_axis_sdo_tvalid <= 1'b0;
            s_axis_sdo_tdata  <= 8'd0;

            m_axis_sdi_tready <= 1'b0;

            r_spi_reg         <= 32'd0;
            r_timer           <= 32'd0;
            r_cnt             <= 32'd0;
            r_cfg_rdata       <= 32'd0;

            spi_cs_int        <= 32'hffffffff;
        end else begin
            case (rcfg_cur_state)
            // spi_init
            16'h0000: begin
                rcfg_cur_state   <= 16'h0001;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_WRITE, 2'b00, REG_CONFIG, 8'b00000100};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= 32'd0;
                r_timer           <= 32'd0;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end
            16'h0001: begin
                rcfg_cur_state   <= 16'h0002;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_WRITE, 2'b00, REG_CLK_DIV, 8'd9};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= 32'd0;
                r_timer           <= 32'd0;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end
            16'h0002: begin
                rcfg_cur_state   <= 16'h0003;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_WRITE, 2'b00, REG_WORD_LENGTH, 8'd8};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= 32'd0;
                r_timer           <= 32'd0;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end


    // spi_sendrecv((reg_addr >> 8), &reg_tmp, 0x00);
    // spi_sendrecv(reg_addr & 0xFF, &reg_tmp, 0x00);
    // spi_sendrecv(reg_data, &reg_tmp, 0x00);

            // get reg value
            16'h0003: begin
                rcfg_cur_state    <= 16'h0004;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= (r_timer[7] == 1'b1) ? w_lmk04828Reg_2 : w_lmk04828Reg_1;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end

            // delay
            16'h0004: begin
                rcfg_cur_state    <= (r_cnt[24:17] == r_spi_reg[31:24]) ? 16'h0005 : 16'h0004;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= r_cnt + 1;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end

            16'h0005: begin
                rcfg_cur_state   <= 16'h0006;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b1;
                s_axis_sdo_tdata  <= r_spi_reg[23:16];

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end
            16'h0006: begin
                rcfg_cur_state   <= (m_axis_sdi_tready && m_axis_sdi_tvalid) ? 16'h0007 : 16'h0006;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= r_spi_reg[23:16];

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end
            16'h0007: begin
                rcfg_cur_state   <= 16'h0008;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b1;
                s_axis_sdo_tdata  <= r_spi_reg[15:8];

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end
            16'h0008: begin
                rcfg_cur_state   <= (m_axis_sdi_tready && m_axis_sdi_tvalid) ? 16'h0009 : 16'h0008;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= r_spi_reg[23:16];

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end
            16'h0009: begin
                rcfg_cur_state   <= 16'h000A;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b1;
                s_axis_sdo_tdata  <= r_spi_reg[7:0];

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end
            16'h000A: begin
                rcfg_cur_state   <= (m_axis_sdi_tready && m_axis_sdi_tvalid) ? 16'h000B : 16'h000A;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= r_spi_reg[23:16];

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end

            16'h000B: begin
                rcfg_cur_state   <= (r_cnt == 32'd19) ? 16'h000C : 16'h000B;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= 16'd0;

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= (r_cnt == 32'd19) ? r_timer + 1'b1 : r_timer;
                r_cnt             <= r_cnt + 1'b1;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= (r_timer < lmk04828_regs_all) ? 32'h7fffffff : 32'hfffffdb6;
            end

            16'h000C: begin
                rcfg_cur_state   <= (r_timer == (lmk04828_regs_all + ad9680_regs_all)) ? 16'h000D : (r_cnt == 32'd49) ? 16'h0003 : 16'h000C;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= 16'd0;

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= r_cnt + 1'b1;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end

            // adl5205
            16'h000D: begin
                rcfg_cur_state   <= 16'h000E;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b1;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= (r_timer[7] == 1'b1) ? w_lmk04828Reg_2 : w_lmk04828Reg_1;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hfffff249;
            end
            16'h000E: begin
                rcfg_cur_state   <= (m_axis_sdi_tready && m_axis_sdi_tvalid) ? 16'h000F : 16'h000E;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hfffff249;
            end
            16'h000F: begin
                rcfg_cur_state   <= 16'h0010;

                s_axis_cmd_tvalid <= 1'b1;
                s_axis_cmd_tdata  <= {2'b00, CMD_TRANSFER, 2'd0, 1'b1, 1'b1, 8'h00};

                s_axis_sdo_tvalid <= 1'b1;
                s_axis_sdo_tdata  <= r_spi_reg[7:0];

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hfffff249;
            end
            16'h0010: begin
                rcfg_cur_state   <= (m_axis_sdi_tready && m_axis_sdi_tvalid) ? 16'h0011 : 16'h0010;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= 16'd0;

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hfffff249;
            end

            16'h0011: begin
                rcfg_cur_state   <= (r_cnt == 32'd19) ? 16'h0012 : 16'h0011;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= 16'd0;

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= r_cnt + 1'b1;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hfffff249;
            end

            16'h0012: begin
                rcfg_cur_state   <= (r_cnt == 32'd24999999) ? 16'h0013 : 16'h0012;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= 16'd0;

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b1;

                r_spi_reg         <= r_spi_reg;
                r_timer           <= r_timer;
                r_cnt             <= r_cnt + 1'b1;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end

            // IDLE
            16'h0013: begin
                rcfg_cur_state   <= ((ram_addr_i[7:0] == 8'hff) && (ram_wea_i == 4'b1111)) ? 16'd0: 16'h0013;

                s_axis_cmd_tvalid <= 1'b0;
                s_axis_cmd_tdata  <= 16'd0;

                s_axis_sdo_tvalid <= 1'b0;
                s_axis_sdo_tdata  <= 8'd0;

                m_axis_sdi_tready <= 1'b0;

                r_spi_reg         <= 32'd0;
                r_timer           <= 32'd0;
                r_cnt             <= 32'd0;
                r_cfg_rdata       <= 32'd0;

                spi_cs_int        <= 32'hffffffff;
            end
            default:rcfg_cur_state <= rcfg_cur_state;
            endcase
        end

    end
    
    assign cfg_finish_o = (rcfg_cur_state < 16'h0013) ? 1'b0 : 1'b1;
    
    assign ocfg_cur_state = rcfg_cur_state;
   
endmodule