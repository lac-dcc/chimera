// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Andres Calderon <andres.calderon@admobilize.com>
*          Kevin Patiño    <kevin.patino@admobilize.com>        
*
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module spi_slave #(parameter DATA_WIDTH = "mandatory") (
  input                       clk           ,
  input                       resetn        ,
  // SPI interface
  input                       mosi          ,
  input                       ss            ,
  input                       sck           ,
  output                      miso          ,
  output reg [DATA_WIDTH-1:0] data_bus_r    ,
  input      [DATA_WIDTH-1:0] data_bus_w    ,
  output reg                  data_enable   ,
  output                      SSEL_active   ,
  input                       load_data_miso
);

// Sync signals
// Sync SCK to the FPGA clock using a 3-bits shift register
  reg [2:0] SCKr; always @(negedge clk)   SCKr <= {SCKr[1:0], sck};

// Sync ss to the FPGA clock using a 3-bits shift register
  reg [2:0] SSELr; always @(posedge clk) SSELr <= {SSELr[1:0], ss};

// and for MOSI
  reg [1:0] MOSIr; always @(posedge clk) MOSIr <= {MOSIr[0], mosi};

  wire SCK_risingedge = (SCKr[2:1]==2'b01); // now we can detect SCK rising edges


  assign SSEL_active = ~SSELr[1]          ; // SSEL is active low
  wire SSEL_startmessage = (SSELr[2:1]==2'b10); // message starts at falling edge

  wire MOSI_data = MOSIr[1];

  reg [2:0] state       ;
  reg [4:0] counter     ;
  reg       shift_enable,counter_reset;

  always @(posedge clk or posedge resetn) begin
    if (resetn | counter_reset)
      counter <= 0;
    else begin
      if(SCK_risingedge)
        counter <= counter + 1;
      else
        counter <= counter;
    end
  end

  localparam [2:0] S_IDLE             = 3'd0;
  localparam [2:0] S_START_WORD       = 3'd1;
  localparam [2:0] S_SERDES_PRESAMPLE = 3'd2;
  localparam [2:0] S_SERDES_SAMPLE    = 3'd3;
  localparam [2:0] S_COMPLETED        = 3'd4;

  always @(posedge clk or posedge resetn) begin
    if(resetn)
      state <= S_IDLE;
    else begin
      case(state)
        S_IDLE :
          if(SSEL_startmessage)
            state <= S_START_WORD;
        else
          state <= S_IDLE;

        S_START_WORD :
          if(!SSEL_active)
            state <= S_IDLE;
          else
            state <= S_SERDES_PRESAMPLE;

        S_SERDES_PRESAMPLE :
          if(!SSEL_active)
            state <= S_IDLE;
          else if(SCK_risingedge)
            state <= S_SERDES_SAMPLE;
          else
            state <= S_SERDES_PRESAMPLE;

        S_SERDES_SAMPLE :
          if(!SSEL_active)
            state <= S_IDLE;
          else if(counter==DATA_WIDTH)
            state <= S_COMPLETED;
          else
            state <= S_SERDES_PRESAMPLE;

        S_COMPLETED :
          if(!SSEL_active)
            state <= S_IDLE;
          else
            state <= S_START_WORD;

        default :
          state <= S_IDLE;

      endcase
    end
  end

  always @(state) begin
    shift_enable  = 1'b0;
    data_enable   = 1'b0;
    counter_reset = 1'b0;

    case(state)
      S_IDLE :
        counter_reset = 1'b1;

      S_SERDES_SAMPLE :
        shift_enable = 1'b1;

      S_COMPLETED : begin
        data_enable   = 1'b1;
        counter_reset = 1'b1;
      end

      default : begin
        shift_enable  = 1'b0;
        data_enable   = 1'b0;
        counter_reset = 1'b0;
      end

    endcase
  end

  always @(posedge clk or posedge resetn) begin
    if (resetn| ~SSEL_active)
      data_bus_r <= 0;
    else begin
      if(shift_enable)
        data_bus_r <= {data_bus_r[DATA_WIDTH-2:0],MOSI_data};
      else
        data_bus_r <= data_bus_r;
    end
  end

  reg [DATA_WIDTH-1:0] MISOr;
  assign miso = MISOr[DATA_WIDTH-1];

  always @(posedge clk or posedge resetn) begin
    if (resetn | ~SSEL_active)
      MISOr <= 0;
    else begin
      if(load_data_miso)
        MISOr <= data_bus_w;
      else if (shift_enable)
        MISOr <= {MISOr[DATA_WIDTH-2:0],1'b0};
      else
        MISOr <= MISOr;
    end
  end

endmodule


