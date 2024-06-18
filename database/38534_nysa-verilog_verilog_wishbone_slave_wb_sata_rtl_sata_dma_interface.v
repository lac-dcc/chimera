// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`define MAX_SECTOR_COUNT 24'h10000
//`define MAX_SECTOR_COUNT 24'h00040


module sata_dma_interface (
  input               clk,
  input               rst,

  input               enable,

  //SATA Controller Interface
  output  reg [7:0]   sata_command,
  output  reg         sata_execute_command_stb, //Execute Command Strobe
  output  reg [47:0]  sata_lba,                 //SATA Sector Address
  output  reg [15:0]  sata_sector_count,        //512 Increment

  input               sata_busy,

  //Write Side
  input               write_enable,
  input       [63:0]  write_addr,
  output              write_finished,
  input       [23:0]  write_count,
  input               write_flush,

  input       [1:0]   write_activate,
  input               write_strobe,
  input               write_empty,

  output              enable_write_ready,

  //Read Side
  input               read_enable,
  input       [63:0]  read_addr,
  output              read_busy,
  output              read_error,
  input       [23:0]  read_count,
  input               read_flush,

  input               read_activate,
  input               read_strobe

);

//Local Parameters
localparam              IDLE            =   4'h0;
localparam              WRITE_SETUP     =   4'h1;
localparam              WRITE_COMMAND   =   4'h2;
localparam              WRITE           =   4'h3;
localparam              WRITE_FINISHED  =   4'h4;
localparam              READ_SETUP      =   4'h5;
localparam              READ_COMMAND    =   4'h6;
localparam              READ            =   4'h7;
localparam              READ_FINISHED   =   4'h8;

//Registers/Wires
//Can we reduce these two values to one?
reg         [23:0]      sata_write_count;
reg         [23:0]      sata_read_count;

//Add a delay to allow the address and sector to be set up
reg         [3:0]       state;
reg         [23:0]      total_sector_count;
reg         [23:0]      dword_count;
wire        [23:0]      total_dword_size;
reg                     write_finished;
reg                     read_finished;

reg                     enable_write_fifo;


//Submodules
//Asynchronous Logic
assign  read_busy                   = read_enable && !read_finished;
//XXX How to detect Errors?
assign  read_error                  = 0;

//NEW
assign  total_dword_size            = (sata_sector_count == 16'h0000)   ?
                                        `MAX_SECTOR_COUNT   << 7 :
                                        sata_sector_count   << 7;

assign  enable_write_ready          = enable && enable_write_fifo;
//Synchronous Logic
always @ (posedge clk) begin
  if (rst || !enable) begin
    sata_lba                    <=  0;
    sata_sector_count           <=  0;
    sata_command                <=  0;

    sata_execute_command_stb    <=  0;

    state                       <=  IDLE;
    total_sector_count          <=  0;
    dword_count                 <=  0;

    write_finished              <=  0;
    read_finished               <=  0;
    enable_write_fifo           <=  0;

  end
  else begin
    //Strobes
    sata_execute_command_stb          <=  0;
    write_finished                    <=  0;
    read_finished                     <=  0;

    case (state)
        IDLE: begin
            //If Write Enable is set transition to Write Setup
            if (write_enable) begin
                total_sector_count    <=  write_count[23:7] + (write_count[6:0] > 0); //The extra '+' is to take care of overflow
                sata_lba              <=  write_addr[55:6];
                sata_command          <=  8'h35;
                state                 <=  WRITE_SETUP;
            end
            else if (read_enable) begin
                total_sector_count    <=  read_count[23:7] + (read_count[6:0] > 0); //The extra '+' is to take care of overflow
                sata_lba              <=  read_addr[55:6];
                sata_command          <=  8'h25;
                state                 <=  READ_SETUP;
            end
        end
        WRITE_SETUP: begin
            //Given the address and size determine if we can send all or some of
            //of the data to the hard drive
            //Fall directly through to writing the command
            if (!sata_busy) begin
              if (total_sector_count  >= `MAX_SECTOR_COUNT) begin
                  //sata_sector_count   <=  16'h0000;
                  sata_sector_count   <=  `MAX_SECTOR_COUNT;
                  total_sector_count  <=  total_sector_count - `MAX_SECTOR_COUNT;
              end
              else begin
                  sata_sector_count   <=  total_sector_count;
                  total_sector_count  <=  0;
              end
              dword_count             <=  0;
              state                   <=  WRITE_COMMAND;
              enable_write_fifo       <=  1;
            end
        end
        WRITE_COMMAND: begin
            //Tell the hard drive to execute
            sata_execute_command_stb  <=  1;
            state                     <=  WRITE;
        end
        WRITE: begin
            //Write the entire chunk of data, track the write count
            if ((write_activate > 0) && write_strobe) begin
                dword_count           <=  dword_count + 1;
            end
            if (dword_count >= total_dword_size) begin
                enable_write_fifo     <=  0;
                if (!sata_busy) begin
                    //Wait for the hard drive to finish it's transaction too
                    if (total_sector_count > 0) begin
                        state         <=  WRITE_SETUP;
                        sata_lba      <=  sata_lba + `MAX_SECTOR_COUNT;
                    end
                    else begin
                        state         <=  WRITE_FINISHED;
                    end
                end
            end
        end
        WRITE_FINISHED: begin
            //A single hard drive command has finished, determine if we need
            //to read or write more data to the hard drive
            write_finished          <=  1;
            if (!write_enable) begin
                state               <=  IDLE;
            end
        end
        READ_SETUP: begin
            //Given the address and size determine if we can read all or some of
            //of the data from the hard drive
            //Fall directly through to execute the command
            if (!sata_busy) begin
              if (total_sector_count  >= `MAX_SECTOR_COUNT) begin
                  sata_sector_count   <=  16'h0000;
                  total_sector_count  <=  total_sector_count - `MAX_SECTOR_COUNT;
              end
              else begin
                  sata_sector_count   <=  total_sector_count;
                  total_sector_count  <=  0;
              end
              dword_count             <=  0;
              state                   <=  READ_COMMAND;
            end
        end
        READ_COMMAND: begin
            //Initiate the transaction with the hard drive
            sata_execute_command_stb<=  1;
            state                   <=  READ;
        end
        READ: begin
            //Track the read count to determine if we are done reading the data
            if (read_activate && read_strobe) begin
                dword_count         <=  dword_count + 1;
            end
            if ((dword_count >= total_dword_size) && !sata_busy) begin
                //Wait for hard drive to finish it's transaction too
                if (total_sector_count > 0) begin
                    state           <=  READ_SETUP;
                end
                else begin
                    state           <=  READ_FINISHED;
                end
            end
        end
        READ_FINISHED: begin
            //This transaction is finished, do we need to execute more?
            read_finished           <=  1;
            if (!read_enable) begin
                state               <= IDLE;
            end
        end
        default: begin
            //XXX: Shouldn't get here
            state   <=  IDLE;
        end
    endcase
  end
end

endmodule
