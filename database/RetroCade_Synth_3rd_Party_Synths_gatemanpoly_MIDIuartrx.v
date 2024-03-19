//------------------------------------------------------------------------------
// Uart Reciever
// Created March 21, 2004 by James Patchell
//
// Doing a Uart Reciever is a lot more complicated than doing a Uart Transmitter
// Parameters:
//  dout.......this is the data that is recieved, valid only when ready is true
//  clk........16x baud rate clock
//  reset......resets all of the registers
//  rxd........recieve data input
//  frame......frame error output........Not Implemented Yet
//  overrun....overrun error output......Not Implemented Yet
//  ready......indicates that all 8 bits have been read
//
//------------------------------------------------------------------------------
// Revision History:
// Rev 1.01
//  April 17, 2005
//  Changed the shift register to shift the LSB out first
// Rev 1.01a (Scott R. Gravenhorst), baud rate clock added.
// Rev 1.02  (Scott R. Gravenhorst)
//  January 26, 2007
//  Added 2 RS flipflops to facilitate easier interface with PicoBlaze 
//------------------------------------------------------------------------------
// Internal 16x baud clock fixed at MIDI rate. (scott  gravenhorst)
// rxready_status & interrupt flip-flops added for easier interface with PicoBlaze (scott gravenhorst)
//------------------------------------------------------------------------------

module MIDIuartrx(dout,clk,reset,rxd,frame,overrun,ready,busy,CS,
                  interrupt,interrupt_ack,rxready_status,reset_rxready_status);
  output [7:0] dout;    // data output from input shift register
  input clk;            // system clock
  input reset;          // reinitializes the whole mess
  input rxd;            // serial port input
  output frame;         // framing error
  output overrun;       // overrun error
  output ready;         // data is ready
  output [3:0] CS;      // For debug use
  output busy;
  output interrupt;     // for PicoBlaze
  input interrupt_ack;  // for PicoBlaze
  output rxready_status;
  input reset_rxready_status;

  wire interrupt;
  wire interrupt_ack;
  wire rxready_status;
  wire reset_rxready_status;

  wire frame;
  wire overrun;
  reg [7:0] dout;
  reg ready;
  reg din,din1,din2;
  reg syncbitcnt;       // synchronize the clock bit divider
  reg [3:0] bitcnt;     // divide by sixteen bit counter
  reg bitenable;        // indicate bit time
  reg shiftenable;      // enable shifter
  reg start;            // indicates a start condition
  reg done;             // indicate all bits shifted in
  reg busy;
  reg [3:0] NS;
  reg [3:0] CS;
  reg [7:0] datain;     // data in shift register
  reg loadout;          // transfers data from datain to dout

  reg bclk = 0;             // for 16x baud clock
//  integer baudcounter;
  reg [6:0] baudcounter = 0;

  assign frame = 0;
  assign overrun = 0;

// SRG added this baud rate clock:
//-----------------------------------------------------------
// 16x baud clock fixed at MIDI rate 31.250 Kbaud (clk = 50MHz)
//-----------------------------------------------------------

  always @ ( posedge clk )
    begin
    if ( baudcounter == 7'd99 ) begin bclk <= 1'b1; baudcounter <= 0; end
	 else                        begin bclk <= 1'b0; baudcounter <= baudcounter + 7'b1; end
  end
  
//-----------------------------------------------------------
// Start bit detection logic
//-----------------------------------------------------------

always @(posedge clk or posedge reset)
begin
  if(reset) begin
    din <= 1;
    din1 <= 1;
    din2 <= 1;
  end
  else begin
    if (bclk)
    begin
      din <= din1;      // shift
      din1 <= din2;
      din2 <= rxd;
    end
    else
    begin
      din <= din;       // hold
      din1 <= din1;
      din2 <= din2;
    end

  end
end

always @(din or din1 or bclk)
begin
  start <= din & !din1 & bclk;  //indicates we have a start condition
end

//---------------------------------------------------------
// status bit indicates if we are in the process of getting
// a byte in
//---------------------------------------------------------

always @ (posedge clk or posedge reset)
begin
  if(reset)
    busy <= 0;
  else
  begin
    if(start)
      busy <= 1;
    else if (done)
      busy <= 0;
  end  
end

//---------------------------------------------------------
// this bit will go true for one clock cycle indicating that
// the output holding register has a byte in it ready for
// use
//---------------------------------------------------------

always @ (posedge clk)
  ready <= done;

//--------------------------------------------------------
// when we get a start condition and we are not busy,
// resync the bit counter
//--------------------------------------------------------

always @ (start or busy)
begin
  if(start && !busy)
    syncbitcnt <= 1;
  else
    syncbitcnt <= 0;
end

always @(posedge clk or posedge reset)
//-------------------------------------------------------
// this is the divider for the 16x clock
// syncbitcnt is used to syncronize this counter with the
// start bit
//-------------------------------------------------------
begin
  if (reset)
    bitcnt <= 4'b0;         // initialize counter
  else begin

    if (syncbitcnt)         // synchronize
      bitcnt <= 4'b0;
    else if(bclk)
      bitcnt <= bitcnt + 1; // count
    else
      bitcnt <= bitcnt;     // hold
  end
end

always @(bitcnt or bclk)
//----------------------------------------------
// we want to check the serial stream right in 
// the middle of the bit time
//----------------------------------------------
begin
  if(bitcnt == 4'b1000)     // if count == 8
    bitenable <= bclk;
  else
    bitenable <= 0;
end

//----------------------------------------------------
// data shift register
//----------------------------------------------------

always @(posedge clk or posedge reset) 
begin
  if(reset) begin
    datain <= 0;                 // reset shift register to zero
    end
  else if(shiftenable)
    datain <= {din,datain[7:1]}; //shift when told to
  else
    datain <= datain;            // hold that thought.     
end

//----------------------------------------------------
// output register
//----------------------------------------------------

always @ (posedge clk or posedge reset)
begin
  if(reset)
    dout <= 0;
  else if (loadout)
    dout <= datain;
end

//----------------------------------------------------
// UART rx State Machine
// as it turns out...this looks an awful lot like the
// transmit state machine :-)
//
// it should be noted, the LSB is the first bit to
// be transmitted...the states would seem to imply
// that we start at BIT7...well, that is wrong
//
//----------------------------------------------------

parameter [3:0] //synopsys enum STATE_TYPE
  UART_IDLE = 4'b0000,
  UART_STARTBIT = 4'b0001,
  UART_BIT7 = 4'b0010,
  UART_BIT6 = 4'b0011,
  UART_BIT5 = 4'b0100,
  UART_BIT4 = 4'b0101,
  UART_BIT3 = 4'b0110,
  UART_BIT2 = 4'b0111,
  UART_BIT1 = 4'b1000,
  UART_BIT0 = 4'b1001,
  UART_STOPBIT = 4'b1010;

  always @ (posedge clk or posedge reset)
  begin
    if (reset) CS <= UART_IDLE;
    else CS <= NS;
  end
 
  always @ (CS or bitenable or start)
  begin 
    case (CS)                    // synopsys full_case
      UART_IDLE: begin
        if(start)
        begin
          NS = UART_STARTBIT;
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
        else
        begin
          NS = UART_IDLE;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_STARTBIT: begin
        if(bitenable)
        begin
          NS = UART_BIT7;
          shiftenable = 1;
          loadout = 0;
          done = 0;
        end
        else
        begin
          NS = UART_STARTBIT;    // hold
          shiftenable = 0;
          loadout = 0;
          done = 0;
        end
      end
      UART_BIT7: begin
        if(bitenable)
        begin
          NS = UART_BIT6;
          shiftenable = 1;
          done = 0;
          loadout = 0;
        end
        else
        begin
          NS = UART_BIT7;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT6: begin
        if(bitenable)
        begin
          NS = UART_BIT5;
          shiftenable = 1;
          done = 0;
          loadout = 0;
        end
        else
        begin
          NS = UART_BIT6;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT5: begin
        if(bitenable)
        begin
          NS = UART_BIT4;
          shiftenable = 1;
          done = 0;
          loadout = 0;
        end
        else
        begin
          NS = UART_BIT5;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT4: begin
        if(bitenable)
        begin
          NS = UART_BIT3;
          shiftenable = 1;
          done = 0;
          loadout = 0;
        end
        else
        begin
          NS = UART_BIT4;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT3: begin
        if(bitenable)
        begin
          NS = UART_BIT2;
          shiftenable = 1;
          loadout = 0;
          done = 0;
        end
        else
        begin
          NS = UART_BIT3;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT2: begin
        if(bitenable)
        begin
          NS = UART_BIT1;
          shiftenable = 1;
          loadout = 0;
          done = 0;
        end
        else
        begin
          NS = UART_BIT2;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT1: begin
        if(bitenable)
        begin
          NS = UART_BIT0;
          shiftenable = 1;
          done = 0;
          loadout = 0;
        end
        else
        begin
          NS = UART_BIT1;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_BIT0: begin
        if(bitenable)
        begin
          NS = UART_STOPBIT;
          shiftenable = 1;
          loadout = 0;
          done = 0;
        end
        else
        begin
          NS = UART_BIT0;        // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      UART_STOPBIT: begin
        if(bitenable)
        begin
          NS = UART_IDLE;
          shiftenable = 0;
          done = 1;              // this will clear busy status
          loadout = 1;
        end
        else
        begin
          NS = UART_STOPBIT;     // hold
          shiftenable = 0;
          done = 0;
          loadout = 0;
        end
      end
      default: begin
        NS = UART_IDLE;
        shiftenable = 0;
        done = 0;
        loadout = 0;
      end
    endcase
  end

// SRG added these flipflops for easier interface with PicoBlaze
FDCPE #(
.INIT( 1'b0 ) // Initial value of register (1'b0 or 1'b1)
) FDCPE0 (
.Q( rxready_status ), // Data output
.C( 1'b0 ), // Clock input
.CE( 1'b0 ), // Clock enable input
.CLR( reset_rxready_status | reset ), // Asynchronous clear input
.D( 1'b0 ), // Data input
.PRE( ready ) // Asynchronous set input
);

FDCPE #(
.INIT( 1'b0 ) // Initial value of register (1'b0 or 1'b1)
) FDCPE1 (
.Q( interrupt ), // Data output
.C( 1'b0 ), // Clock input
.CE( 1'b0 ), // Clock enable input
.CLR( interrupt_ack | reset ), // Asynchronous clear input
.D( 1'b0 ), // Data input
.PRE( ready ) // Asynchronous set input
);

endmodule

