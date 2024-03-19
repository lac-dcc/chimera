
module spi_interface(input clk, input spi_sck, input spi_ss, input spi_mosi, output spi_miso,
                     output reg [7:0] spi_cmd, output reg [7:0] spi_data_out, output reg spi_data_out_valid, input [7:0] spi_data_in, input spi_data_in_valid,
                     output spi_data_in_free, output reg [2:0] led_debug);

   parameter NOP=0, INIT=1, SEND_DATA=2, RECEIVE_CMD=3, RECEIVE_DATA=4, SEND_DATA32=5, RECEIVE_DATA32=6;

   //state machine parameters
   parameter INIT_SPICR0=0, INIT_SPICR1=INIT_SPICR0+1, INIT_SPICR2=INIT_SPICR1+1, INIT_SPIBR=INIT_SPICR2+1, INIT_SPICSR=INIT_SPIBR+1,
             SPI_WAIT_RECEPTION=INIT_SPICSR+1, SPI_READ_OPCODE=SPI_WAIT_RECEPTION+1, SPI_READ_LED_VALUE=SPI_READ_OPCODE+1,
             SPI_READ_INIT=SPI_READ_LED_VALUE+1, SPI_SEND_DATA=SPI_READ_INIT+1, SPI_WAIT_TRANSMIT_READY=SPI_SEND_DATA+1,
             SPI_TRANSMIT=SPI_WAIT_TRANSMIT_READY+1;

   parameter SPI_ADDR_SPICR0 = 8'b00001000, SPI_ADDR_SPICR1 = 8'b00001001, SPI_ADDR_SPICR2 = 8'b00001010, SPI_ADDR_SPIBR = 8'b00001011,
             SPI_ADDR_SPITXDR = 8'b00001101, SPI_ADDR_SPIRXDR = 8'b00001110, SPI_ADDR_SPICSR = 8'b00001111, SPI_ADDR_SPISR = 8'b00001100;

   reg [7:0] state_spi;

   //hw spi signals
   reg spi_stb; //strobe must be set to high when read or write
   reg spi_rw; //selects read or write (high = write)
   reg [7:0] spi_adr; // address
   reg [7:0] spi_dati; // data input
   wire [7:0] spi_dato; // data output
   wire spi_ack; //ack that the transfer is done (read valid or write ack)
   //the miso/mosi signals are not used, because this module is set as a slave
   wire spi_miso_unused;
   wire spi_mosi_unused;

   SB_SPI SB_SPI_inst(.SBCLKI(clk), .SBSTBI(spi_stb), .SBRWI(spi_rw),
      .SBADRI0(spi_adr[0]), .SBADRI1(spi_adr[1]), .SBADRI2(spi_adr[2]), .SBADRI3(spi_adr[3]), .SBADRI4(spi_adr[4]), .SBADRI5(spi_adr[5]), .SBADRI6(spi_adr[6]), .SBADRI7(spi_adr[7]),
      .SBDATI0(spi_dati[0]), .SBDATI1(spi_dati[1]), .SBDATI2(spi_dati[2]), .SBDATI3(spi_dati[3]), .SBDATI4(spi_dati[4]), .SBDATI5(spi_dati[5]), .SBDATI6(spi_dati[6]), .SBDATI7(spi_dati[7]),
      .SBDATO0(spi_dato[0]), .SBDATO1(spi_dato[1]), .SBDATO2(spi_dato[2]), .SBDATO3(spi_dato[3]), .SBDATO4(spi_dato[4]), .SBDATO5(spi_dato[5]), .SBDATO6(spi_dato[6]), .SBDATO7(spi_dato[7]),
      .SBACKO(spi_ack),
      .MI(spi_miso_unused), .SO(spi_miso),
      .MO(spi_mosi_unused), .SI(spi_mosi),
      .SCKI(spi_sck), .SCSNI(spi_ss)
   );

   reg is_spi_init; //waits the INIT command from the master

   reg [7:0] counter_read; //count the bytes to read to form a command
   reg [7:0] command_data[63:0]; //the command, saved as array of bytes

   reg [7:0] counter_send; //counts the bytes to send
   reg [7:0] data_to_send; //buffer for data to be written in send register
   reg is_data_to_send;

   reg [7:0] buffer_data_in; //keeps data from the image processing module to be send
   reg buffer_full;

   //not free if buffer is full or data is incoming
   assign spi_data_in_free = !(buffer_full || spi_data_in_valid);

   initial begin

      spi_stb = 0;
      spi_rw = 0;
      spi_adr = 0;
      spi_dati = 0;
      data_to_send = 0;
      is_data_to_send = 0;

      is_spi_init = 0;
      counter_send = 0;

      buffer_full = 0;

      state_spi = INIT_SPICR0;

      led_debug <= 3'b100;
   end

   always @(posedge clk)
   begin

      //default
      spi_stb <= 0;
      spi_data_out_valid <= 0;

      if (spi_data_in_valid == 1) begin
         buffer_data_in <= spi_data_in;
         buffer_full <= 1;
      end

      case (state_spi)
      INIT_SPICR0 : begin //spi control register 0, nothing interesting for this case (delay counts)
         spi_adr <= SPI_ADDR_SPICR0;
         spi_dati <= 8'b00000000;
         spi_stb <= 1;
         spi_rw <= 1;
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= INIT_SPICR1;
         end
      end
      INIT_SPICR1 : begin //spi control register 1
         spi_adr <= SPI_ADDR_SPICR1;
         spi_dati <= 8'b10000000; //bit7: enable SPI
         spi_stb <= 1;
         spi_rw <= 1;
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= INIT_SPICR2;
         end
      end
      INIT_SPICR2 : begin //spi control register 2
         spi_adr <= SPI_ADDR_SPICR2;
         spi_dati <= 8'b00000001; //bit0: lsb first
         spi_stb <= 1;
         spi_rw <= 1;
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= INIT_SPIBR;
         end
      end
      INIT_SPIBR : begin //spi clock prescale
         spi_adr <= SPI_ADDR_SPIBR;
         spi_dati <= 8'b00000000; //clock divider => 1
         spi_stb <= 1;
         spi_rw <= 1;
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= INIT_SPICSR;
         end
      end
      INIT_SPICSR : begin //SPI master chip select register, absolutely no use as SPI module set as slave
         spi_adr <= SPI_ADDR_SPICSR;
         spi_dati <= 8'b00000000;
         spi_stb <= 1;
         spi_rw <= 1;
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= SPI_WAIT_RECEPTION;
            counter_read <= 0;
         end
      end
      SPI_WAIT_RECEPTION : begin
         spi_adr <= SPI_ADDR_SPISR; //status register
         spi_stb <= 1;
         spi_rw <= 0; //read
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= SPI_WAIT_RECEPTION;

            //wait for bit3, tells that data is available
            if (is_spi_init == 0 && spi_dato[3] == 1) begin
               state_spi <= SPI_READ_INIT;
            end

            if (is_spi_init == 1 && spi_dato[3] == 1) begin
               if( (command_data[0] != SEND_DATA32 && counter_send < 2) || (command_data[0] == SEND_DATA32 && counter_send < 31)) begin //can only send 2 bytes back
                  state_spi <= SPI_WAIT_TRANSMIT_READY;
               end else begin
                  state_spi <= SPI_READ_OPCODE;
               end
            end
         end
      end
      SPI_WAIT_TRANSMIT_READY: begin
         spi_adr <= SPI_ADDR_SPISR; //status registers
         spi_stb <= 1;
         spi_rw <= 0; //read
         if(spi_ack == 1) begin
            spi_stb <= 0;

            //bit 4 = TRDY, transmit ready
            if (spi_dato[4] == 1) begin
               state_spi <= SPI_TRANSMIT;
            end
         end
      end
      SPI_TRANSMIT: begin
         spi_adr <= SPI_ADDR_SPITXDR;
         if(counter_send == 0) begin //status
            spi_dati <= 8'b01000000;
            spi_dati[0] <= buffer_full; //tells that something useful was sent
            // spi_dati[0] <= 1; //tells that something useful was sent
         end else begin
            if(is_data_to_send == 1) begin
               spi_dati <= data_to_send;
               // spi_dati <= 8'h48
            end else begin
               spi_dati <= 8'h42;
            end
         end

         spi_stb <= 1;
         spi_rw <= 1;
         if(spi_ack == 1) begin
            spi_stb <= 0;
            counter_send <= counter_send + 1;

            if(is_data_to_send == 1) begin
               is_data_to_send <= 0;
               buffer_full <= 0;
            end

            if (is_spi_init == 0) begin
               state_spi <= SPI_READ_INIT;
            end else begin
               state_spi <= SPI_READ_OPCODE;
            end
         end
      end
      SPI_READ_INIT: begin
         spi_adr <= SPI_ADDR_SPIRXDR; //read data register
         spi_stb <= 1;
         spi_rw <= 0; //read
         if(spi_ack == 1) begin
            spi_stb <= 0;
            state_spi <= SPI_WAIT_RECEPTION;
            command_data[counter_read] <= spi_dato;

            if(spi_dato == 8'h11) begin
               counter_read <= 0;
               is_spi_init <= 1;
               counter_send <= 0;
            end
         end
      end
      SPI_READ_OPCODE: begin
         spi_adr <= SPI_ADDR_SPIRXDR; //read data register
         spi_stb <= 1;
         spi_rw <= 0; //read
         if(spi_ack == 1) begin
            spi_stb <= 0;
            counter_read <= counter_read + 1;

            state_spi <= SPI_WAIT_RECEPTION;
            command_data[counter_read] <= spi_dato;

            if( counter_read == 0 && spi_dato == SEND_DATA) begin
               if(buffer_full == 1)begin
                  data_to_send <= buffer_data_in;
                  is_data_to_send <= 1;
               end
            end
            if( counter_read == 0 && spi_dato == SEND_DATA32 ) begin
               if(buffer_full == 1)begin
                  data_to_send <= buffer_data_in;
                  is_data_to_send <= 1;
               end
            end

            if( counter_read == 1 ) begin
               if( command_data[0] == RECEIVE_CMD) begin
                  spi_data_out_valid <= 1;
                  spi_cmd <= spi_dato;
               end else if( command_data[0] == RECEIVE_DATA) begin
                  spi_data_out_valid <= 1;
                  spi_data_out <= spi_dato;
               end
            end
            if( counter_read >= 1 ) begin
               if( command_data[0] == RECEIVE_DATA32 ) begin
                  spi_data_out_valid <= 1;
                  spi_data_out <= spi_dato;
               end
               else if( command_data[0] == SEND_DATA32 && counter_read < 30) begin
                  if(buffer_full == 1)begin
                     data_to_send <= buffer_data_in;
                     is_data_to_send <= 1;
                  end
               end
            end

            if( command_data[0] == RECEIVE_DATA32 || command_data[0] == SEND_DATA32 ) begin
               if( counter_read == 32 ) begin
                  counter_read <= 0;
                  counter_send <= 0;
               end
            end
            else begin
               if( counter_read == 3 ) begin
                  counter_read <= 0;
                  counter_send <= 0;
               end
            end
         end
      end

      endcase
   end

endmodule
