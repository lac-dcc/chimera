// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


module test_mem_dev #(
    parameter           READ_FIFO_SIZE     = 8,
    parameter           WRITE_FIFO_SIZE    = 8,
    parameter           ADDRESS_WIDTH      = 8,
    parameter           ENABLE_ERROR_CHECK = 1,
    parameter           INITIALIZE_MEM     = 1
)(
    input                                 clk,
    input                                 rst,

    //BRAM Style Interface
    input                                 bram_en,
    input                                 bram_we,
    input       [(ADDRESS_WIDTH - 1):0]   bram_address,
    input       [31:0]                    bram_data_in,
    output      [31:0]                    bram_data_out,
    output                                initializing,

    //Write Side
    input                                 write_enable,
    input       [63:0]                    write_addr,
    input                                 write_addr_inc,
    input                                 write_addr_dec,
    output                                write_finished,
    input       [23:0]                    write_count,
    input                                 write_flush,

    output      [1:0]                     write_ready,
    input       [1:0]                     write_activate,
    output      [23:0]                    write_size,
    input                                 write_strobe,
    input       [31:0]                    write_data,

    //Read Side
    input                                 read_enable,
    input       [63:0]                    read_addr,
    input                                 read_addr_inc,
    input                                 read_addr_dec,
    output                                read_busy,
    output                                read_error,
    input       [23:0]                    read_count,
    input                                 read_flush,

    output                                read_ready,
    input                                 read_activate,
    output      [23:0]                    read_size,
    output      [31:0]                    read_data,
    input                                 read_strobe
);

//Local Parameters
//Registers/Wires
reg     [ADDRESS_WIDTH - 1:0]           mem_addr_in;
reg     [ADDRESS_WIDTH - 1:0]           mem_addr_out;
reg     [23:0]                          mem_write_count;
wire                                    mem_write_overflow;
reg     [23:0]                          local_read_size;
reg     [23:0]                          mem_read_count;
reg                                     mem_read_strobe;
reg                                     mem_write_strobe;

reg                                     prev_write_enable;
wire                                    posedge_write_enable;
reg                                     prev_read_enable;
wire                                    posedge_read_enable;

reg     [31:0]                          prev_f2m_data;
reg                                     f2m_data_error;
reg     [31:0]                          prev_m2f_data;
reg                                     m2f_data_error;

reg                                     f2m_strobe;
wire                                    f2m_ready;
reg                                     f2m_activate;
wire    [23:0]                          f2m_size;
wire    [31:0]                          f2m_data;

reg     [23:0]                          f2m_count;

wire    [1:0]                           m2f_ready;
reg     [1:0]                           m2f_activate;
wire    [23:0]                          m2f_size;
reg                                     m2f_strobe;
wire    [31:0]                          m2f_data;

reg     [23:0]                          m2f_count;
reg                                     first_write;

wire    [31:0]                          din;
wire                                    wea;

reg                                     fill_mem;
reg     [31:0]                          fill_mem_data;
reg                                     fill_mem_wea;

wire                                    write_fifo_empty;

wire                                    blk_mem_we;
wire                                    blk_mem_en;
wire    [(ADDRESS_WIDTH - 1):0]         blk_mem_wr_addr;
wire    [(ADDRESS_WIDTH - 1):0]         blk_mem_rd_addr;
wire    [31:0]                          blk_mem_data_in;

wire                                    enable_error_check;

//Submodules
blk_mem #(
    .DATA_WIDTH         (32             ),
    .ADDRESS_WIDTH      (ADDRESS_WIDTH  )
) mem (
    .clka               (clk            ),
    .wea                (blk_mem_we     ),
    .dina               (blk_mem_data_in),
    .addra              (blk_mem_wr_addr),

    .clkb               (clk            ),
    .doutb              (m2f_data       ),
    .addrb              (blk_mem_rd_addr)
);

ppfifo#(
  .DATA_WIDTH           (32             ),
  .ADDRESS_WIDTH        (WRITE_FIFO_SIZE)
)fifo_to_mem (
  .reset                (rst            ),

  //Write
  .write_clock          (clk            ),
  .write_ready          (write_ready    ),
  .write_activate       (write_activate ),
  .write_fifo_size      (write_size     ),
  .write_strobe         (write_strobe   ),
  .write_data           (write_data     ),

  .starved              (write_fifo_empty),

  //Read
  .read_clock           (clk            ),
  .read_strobe          (f2m_strobe     ),
  .read_ready           (f2m_ready      ),
  .read_activate        (f2m_activate   ),
  .read_count           (f2m_size       ),
  .read_data            (f2m_data       )

  //.inactive           (               )

);


ppfifo#(
  .DATA_WIDTH           (32             ),
  .ADDRESS_WIDTH        (READ_FIFO_SIZE )
)mem_to_fifo (
  .reset                (rst            ),

  //Write
  .write_clock          (clk            ),
  .write_ready          (m2f_ready      ),
  .write_activate       (m2f_activate   ),
  .write_fifo_size      (m2f_size       ),
  .write_strobe         (m2f_strobe     ),
  .write_data           (m2f_data       ),

  //.starved            (               ),

  //Read
  .read_clock           (clk            ),
  .read_strobe          (read_strobe    ),
  .read_ready           (read_ready     ),
  .read_activate        (read_activate  ),
  .read_count           (read_size      ),
  .read_data            (read_data      )

  //.inactive           (               )

);

//Asynchronous Logic
assign  posedge_write_enable        =   !prev_write_enable  && write_enable;
assign  posedge_read_enable         =   !prev_read_enable   && read_enable;

assign  mem_write_overflow          =   ((write_count > 0) && (mem_write_count >  write_count));
assign  write_finished              =   ((write_count > 0) && (mem_write_count >= write_count) && write_fifo_empty);

assign  mem_read_overflow           =   ((local_read_size > 0) && (mem_read_count >  local_read_size));
assign  read_finished               =   ((local_read_size > 0) && (mem_read_count >= local_read_size));

assign din                          =   fill_mem ? fill_mem_data: f2m_data;
assign wea                          =   fill_mem ? fill_mem_wea: f2m_strobe;
assign read_error                   =   m2f_data_error;

assign blk_mem_we                   =   bram_en ? bram_we           : wea;
assign blk_mem_wr_addr              =   bram_en ? bram_address      : mem_addr_in;
assign blk_mem_rd_addr              =   bram_en ? bram_address      : mem_addr_out;
assign blk_mem_data_in              =   bram_en ? bram_data_in      : din;
assign bram_data_out                =   m2f_data;

assign initializing                 =   fill_mem_wea;
assign enable_error_check           =   ENABLE_ERROR_CHECK;


//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    mem_addr_in                     <=  0;
    mem_addr_out                    <=  0;

    f2m_strobe                      <=  0;
    f2m_activate                    <=  0;
    f2m_count                       <=  0;

    m2f_activate                    <=  0;
    m2f_strobe                      <=  0;
    m2f_count                       <=  0;

    prev_write_enable               <=  0;
    prev_read_enable                <=  0;

    local_read_size                 <=  0;
    mem_write_count                 <=  0;
    mem_read_count                  <=  0;
    mem_read_strobe                 <=  0;
    mem_write_strobe                <=  0;

    f2m_data_error                  <=  0;
    m2f_data_error                  <=  0;
    prev_f2m_data                   <=  0;
    first_write                     <=  0;

    fill_mem                        <=  INITIALIZE_MEM;
    fill_mem_data                   <=  0;
    fill_mem_wea                    <=  INITIALIZE_MEM;

    prev_m2f_data                   <=  0;

  end
  //Fill Memory Device
  else if (fill_mem) begin
    fill_mem_wea                     <= 1;
    if (mem_addr_in < (2 ** ADDRESS_WIDTH - 1)) begin
        fill_mem_data               <= mem_addr_in + 1;
        mem_addr_in                 <= mem_addr_in + 1;
    end
    else begin
        fill_mem                    <= 0;
        fill_mem_wea                <= 0;
    end
  end
  else begin
    //Strobes
    f2m_strobe                      <=  0;
    m2f_strobe                      <=  0;
    mem_read_strobe                 <=  0;
    mem_write_strobe                <=  0;
    f2m_data_error                  <=  0;
    first_write                     <=  0;
    m2f_data_error                  <=  0;

    //Errors (Incomming)
    if ((f2m_count > 0) && mem_write_strobe && !write_flush) begin
      if ((prev_f2m_data == (2 ** ADDRESS_WIDTH) - 1) && (f2m_data != 0)) begin
      //if ((mem_addr_in == (2 ** ADDRESS_WIDTH) - 1) && (f2m_data != 0)) begin
        f2m_data_error              <=   1;
        if (enable_error_check) begin
          $display ("Write: Wrap Error @ 0x%h: 0x%h != 0x%h", mem_addr_in, prev_f2m_data + 1, f2m_data);
        end
      end
      else if ((prev_f2m_data + 1) != f2m_data) begin
        if (first_write) begin
          if (prev_f2m_data != f2m_data) begin
            f2m_data_error          <=  1;
            if (enable_error_check) begin
              $display ("Write: First Write Error @ 0x%h: 0x%h != 0x%h", mem_addr_in, prev_f2m_data + 1, f2m_data);
            end
          end
        end
        else begin
          f2m_data_error              <=  1;
          if (enable_error_check) begin
            $display ("Write: Error @ 0x%h: 0x%h != 0x%h", mem_addr_in, prev_f2m_data + 1, f2m_data);
          end
        end
      end
    end

    //Error (Outgoing)
    //if ((m2f_count > 0) && mem_read_strobe && !read_flush) begin
    if ((m2f_count > 0) && m2f_strobe && !read_flush && ((m2f_activate & m2f_ready) == 0)) begin
      if (((prev_m2f_data + 1)== (2 ** ADDRESS_WIDTH)) && (m2f_data != 0))begin
        m2f_data_error                  <= 1;
        if (enable_error_check) begin
          $display ("Read: Wrap Error @ 0x%h should be 0", prev_m2f_data);
        end
      end
      else if ((prev_m2f_data + 1) != m2f_data) begin
        m2f_data_error                  <= 1;
        if (enable_error_check) begin
          $display ("Read: Error @ 0x%h: 0x%h != 0x%h", mem_addr_out, m2f_data, (prev_m2f_data + 1));
        end
      end
    end

    //Store Memory Address
    if (posedge_write_enable) begin
        mem_addr_in                 <=  write_addr[ADDRESS_WIDTH - 1: 0];
        mem_write_count             <=  0;
    end
    if (posedge_read_enable) begin
        mem_addr_out                <=  read_addr[ADDRESS_WIDTH - 1: 0];
        local_read_size             <=  read_count;
        mem_read_count              <=  0;
    end

    if (!read_enable) begin
        local_read_size             <=  0;
    end

    //If available get a peice of the FIFO that I can write data to the memory
    if (!f2m_activate && f2m_ready) begin
        f2m_activate                <=  1;
        f2m_count                   <=  0;
    end

    //If there is an available FIFO to write to grab it
    if ((m2f_activate == 0) && (m2f_ready > 0)) begin
      m2f_count                     <=  0;
      if (m2f_ready[0]) begin
        m2f_activate[0]             <=  1;
      end
      else begin
        m2f_activate[1]             <=  1;
      end
    end

    if (mem_read_strobe) begin
      if (read_addr_inc) begin
        mem_addr_out                <=  mem_addr_out + 1;
      end
      else if (read_addr_dec) begin
        mem_addr_out                <=  mem_addr_out - 1;
      end
      m2f_strobe                    <=   1;
    end

    if (!m2f_strobe &&
        !mem_read_strobe && (m2f_activate > 0) &&
        ((m2f_count >= m2f_size) ||
         (mem_read_count > 0 &&
          mem_read_count >= local_read_size))) begin
      m2f_activate  <=  0;
    end

    if (mem_write_strobe) begin
      mem_write_count             <=  mem_write_count + 1;
      if (write_addr_inc) begin
        mem_addr_in               <=  mem_addr_in + 1;
      end
      else if (write_addr_dec) begin
        mem_addr_in               <=  mem_addr_in - 1;
      end

    end
    //if (write_enable) begin
      if (f2m_count < f2m_size) begin
        if (f2m_activate) begin
          f2m_strobe                  <=  1;
          mem_write_strobe            <=  1;
          f2m_count                   <=  f2m_count + 1;
          if (f2m_count == 0) begin
            first_write               <=  1;
          end
        end
      end
      else begin
        f2m_activate  <=  0;
      end
    //end


    if (mem_read_count < local_read_size) begin
      if (read_enable) begin
        if ((m2f_activate  > 0) && (m2f_count < m2f_size)) begin
          m2f_count                   <=  m2f_count + 1;
          mem_read_strobe             <=  1;
          mem_read_count              <=  mem_read_count + 1;
        end
      end
    end

    if (m2f_strobe) begin
        prev_m2f_data                 <=  m2f_data;
    end

    prev_f2m_data      <=  f2m_data;
    prev_write_enable  <=  write_enable;
    prev_read_enable   <=  read_enable;

  end
end


endmodule
