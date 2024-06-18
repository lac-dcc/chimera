// This program was cloned from: https://github.com/Fe1LDr/Grinch
// License: MIT License

module spi_control #(
  // Module clock frequency
    parameter SPI_CLK_FREQ  = 2_000_000,
  // Desired update interval
    parameter UPDATE_FREQ   = 50
)(
  // Host side signals
    input                   reset_n,
  // Clock for logic outside of spi_control
    input                   clk,
  // Clock for SPI interface and SPI serdes logic
    input                   spi_clk, // Should be in phase with clk
    input                   spi_clk_out,
  // Interfacing logic
    output                  data_update,
    output [15:0]           data_x,
    output [15:0]           data_y,
  // SPI side signals
    output                  SPI_SDI,
    input                   SPI_SDO,
    output                  SPI_CSN,
    output                  SPI_CLK,
    input [1:0]             interrupt // SPI interrupts - currently disconnected
);

////////////////////////////////////////////////////////////////////////////////
// MODULE PARAMETERS
////////////////////////////////////////////////////////////////////////////////
  // Control for update timings.
    localparam TIMECOUNT = SPI_CLK_FREQ / UPDATE_FREQ;
  // Width of data packet to transmit.
    localparam SDI_WIDTH = 16;
  // Width of received data packet.
    localparam SDO_WIDTH = 8;
  // Write/Read Mode 
    localparam WRITE_MODE      = 2'b00;
    localparam READ_MODE       = 2'b10;
  // Initial Reg Number 
    localparam INI_NUMBER      = 4'd11;
  // SPI State 
    localparam   IDLE            = 0;
    localparam   TRANSFER        = 1;
    localparam   INTERACT        = 2;
  // Write Reg Address 
    localparam   BW_RATE         = 6'h2c;
    localparam   POWER_CONTROL   = 6'h2d;
    localparam   DATA_FORMAT     = 6'h31;
    localparam   INT_ENABLE      = 6'h2E;
    localparam   INT_MAP         = 6'h2F;
    localparam   THRESH_ACT      = 6'h24;
    localparam   THRESH_INACT    = 6'h25;
    localparam   TIME_INACT      = 6'h26;
    localparam   ACT_INACT_CTL   = 6'h27;
    localparam   THRESH_FF       = 6'h28;
    localparam   TIME_FF         = 6'h29;
  // Read Reg Address
    localparam   INT_SOURCE      = 6'h30; // INT Status
    localparam   X_LB            = 6'h32; // Low Byte
    localparam   X_HB            = 6'h33; // High Byte
    localparam   Y_LB            = 6'h34; // Low Byte 
    localparam   Y_HB            = 6'h35; // High Byte
    localparam   Z_LB            = 6'h36; // Low Byte 
    localparam   Z_HB            = 6'h37; // High Byte
////////////////////////////////////////////////////////////////////////////////
// Signal Declarations
////////////////////////////////////////////////////////////////////////////////
    reg  [3:0]              init_index;
    reg  [SDI_WIDTH-3:0]    write_data;
  // Data from FPGA to Accelerometer
    reg  [SDI_WIDTH-1:0]    data_tx;
    reg                     start;
    wire                    done;
  // Data from Accelerometer to FPGA
    wire [SDO_WIDTH-1:0]    data_rx;
  // State variable
    reg  [1:0]              spi_state;
  // Signals for pulse shortening clock domain crossing.
    reg data_update_internal;
    reg [1:0] data_update_shift;

    reg  [$clog2(TIMECOUNT)-1:0]   sample_count; // reducing the reading rate
    wire sample;
  // States for controlling read and write commands
    reg [2:0] read_index;
    reg [7:0] read_command;
    localparam LAST_READ_COMMAND = 4;

  // Memory for storing results returning from the accelerometer.
  // Currently configured to store the following:
  // 0: data_x[7:0]
  // 1: data_x[15:8]
  // 2: data_y[7:0]
  // 3: data_y[15:8]
    reg [7:0] data_storage [3:0];

  // Unpack data items from storage.
    assign data_x = {data_storage[1], data_storage[0]};
    assign data_y = {data_storage[3], data_storage[2]};

////////////////////////////////////////////////////////////////////////////////
// SERDES instantiation
////////////////////////////////////////////////////////////////////////////////
  spi_serdes serdes (
    .reset_n        (reset_n),
    .spi_clk        (spi_clk),
    .spi_clk_out    (spi_clk_out),
    .data_tx        (data_tx),
    .start          (start),
    .done           (done),
    .data_rx        (data_rx),
    .SPI_SDI        (SPI_SDI),
    .SPI_SDO        (SPI_SDO),
    .SPI_CSN        (SPI_CSN),
    .SPI_CLK        (SPI_CLK)
  );

////////////////////////////////////////////////////////////////////////////////
// Module Logic
////////////////////////////////////////////////////////////////////////////////
  // Initial Setting Table
  always @ (*) begin
    case (init_index)
      // Set activation threshold
        0       : write_data = {THRESH_ACT,     8'h20};
      // Set inactivation threshold
        1       : write_data = {THRESH_INACT,   8'h03};
      // Set inactive timeout
        2       : write_data = {TIME_INACT,     8'h01};
      // Activation detection to DC Coupled
      // Inactivation detection to AC Coupled
      // Configure all axes to participate in activation and inactivation
        3       : write_data = {ACT_INACT_CTL,  8'h7f};
      // Initialize freefall detection to a recommended value
        4       : write_data = {THRESH_FF,      8'h09};
      // Initialize freefall time to a recommended value
        5       : write_data = {TIME_FF,        8'h46};
      // Output rate: 50 Hz
        6       : write_data = {BW_RATE,        8'h09};
      // Enable interrupts on activity only
        7       : write_data = {INT_ENABLE,     8'h10};
      // Send the interrupt for activity to the INT2 pin
        8       : write_data = {INT_MAP,        8'h10};
      // Configure for 4-wire SPI mode.
        9       : write_data = {DATA_FORMAT,    8'h00};
      // Configure the chip to AUTO_SLEEP when inactivity is detected.
        default : write_data = {POWER_CONTROL,  8'h08};
    endcase
  end

// Select read operation
  always @(*) begin
    case (read_index)
      0 : read_command = {READ_MODE, X_LB};
      1 : read_command = {READ_MODE, X_HB};
      2 : read_command = {READ_MODE, Y_LB};
      3 : read_command = {READ_MODE, Y_HB};
      default : read_command = {READ_MODE, INT_SOURCE};
    endcase
  end

// Sample timer
  assign sample = (sample_count == TIMECOUNT - 1);
  always @(posedge spi_clk or negedge reset_n) begin
    if (!reset_n) begin
      sample_count <= 0;
    end else begin
      if (sample) begin
        sample_count <= 0;
      end else begin
        sample_count <= sample_count + 1'b1;
      end
    end 
  end

  always@(posedge spi_clk or negedge reset_n) begin
    if(!reset_n) begin
      init_index              <= 4'b0;
      start                   <= 1'b0;
      spi_state               <= IDLE;
      read_index              <= 0;
      data_update_internal    <= 1'b0;
    // initial setting (write mode)
    // Go through initialization table, writing all the provided settings.
    // When complete, enter normal operation.
    end else if(init_index < INI_NUMBER) begin
      case(spi_state)
        IDLE : begin
          data_tx   <= {WRITE_MODE, write_data};
          start     <= 1'b1;
          spi_state <= TRANSFER;
        end
        TRANSFER : begin
          if (done) begin
            init_index  <= init_index + 4'b1;
            start       <= 1'b0;
            spi_state   <= IDLE;
          end
        end
      endcase
      // Standard operating region.
      end else begin
        // Defaults
      case(spi_state)
        // Wait for timeout "sample" signal.
        IDLE : begin
            data_update_internal    <= 1'b0;
            read_index              <= 0;
            start                   <= 1'b0;
            if (sample) begin
                spi_state <= INTERACT;
            end
        end
        // Load in the next command from the command table.
        // Signal the SPI serdes to begin a transaction
        // If this is not the first read command, store the read results
        //  from the last command to the next index of the data_storage
        //  variable.
        INTERACT : begin
            data_tx[15:8] <= read_command;
            if (read_index > 0) begin
                data_storage[read_index - 1'b1] <= data_rx;
            end
            start <= 1'b1;
            spi_state <= TRANSFER;
        end
        // Don't do anything until the SPI serdes indicates a complete
        // read.
        // Once complete, check the status of the read_command counter
        //  - If the last command (interrupt clear) was sent, complete
        //      read has been achieved. Branch back to IDLE and wait for
        //      next timed start.
        //   - Otherwise, increment the index of the read_index. This will
        //      update the "read_command" to the next command
        //      automatically.
        TRANSFER : begin
            if (done) begin
                start <= 1'b0;
                if (read_index == LAST_READ_COMMAND) begin
                    data_update_internal <= 1'b1;
                    spi_state   <= IDLE;
                end else begin
                    read_index  <= read_index + 1'b1;
                    spi_state   <= INTERACT;
                end
            end
        end
        // Fallback in case something goes horribly wrong.
        default: begin
            spi_state <= IDLE;
        end
      endcase
    end
  end

////////////////////////////////////////////////////////////////////////////////
// Update Pulse Shortener
////////////////////////////////////////////////////////////////////////////////
  always @(posedge clk) begin
    data_update_shift <= {data_update_shift[0], data_update_internal};
  end
  assign data_update = data_update_shift == 2'b01;

endmodule