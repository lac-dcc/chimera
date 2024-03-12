// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_UM245r
`define V_UM245r

// UART Verilog for https://www.ftdichip.com/Support/Documents/DataSheets/Modules/DS_UM245R.pdf
// see also https://hackaday.io/project/166922-spam-1-8-bit-cpu-with-a-tool-chain-twist/log/176325-interactive-verilog-um245r-uart

/* verilator lint_off ASSIGNDLY */
/* verilator lint_off STMTDLY */

`define EOF 32'hFFFF_FFFF 
`define NULL 0 
`define NL 10

`include "../lib/assertion.v"

`timescale 1ns/1ns

`define PRINTMODE_ASCII 1
`define PRINTMODE_NOCTRL 2
`define PRINTMODE_CHARS 3

module um245r #(parameter T3=50, T4=1, T5=25, T6=80, T11=25, T12=80, 
                  //PRINTMODE=`PRINTMODE_NOCTRL, 
                  //PRINTMODE=`PRINTMODE_CHARS, 
                  LOG=0, CONTROL_FILE="uart.control", EXIT_ON_BAD_TIMING=0)  (
    inout [7:0] D,    // Input data
    input WR,        // Writes data on -ve edge
    input _RD,        // When goes from high to low then the FIFO data is placed onto D (equates to _OE)
 
    output _TXE,        // When high do NOT write data using WR, when low write data by strobing WR
    output _RXF        // When high to NOT read from D, when low then data is available to read by strobing RD low
);

function string strip;
    input string str;
    begin
        strip = str;
        if (str.len() > 0) begin
            if (str[str.len()-1] == `NL) begin
                strip = str.substr(0, str.len()-2); 
            end
        end
    end
endfunction


string uart_control_file;
initial begin
    if (! $value$plusargs("uart_control_file=%s", uart_control_file)) begin
        uart_control_file = CONTROL_FILE;
    end
end

string uart_out_file;
initial begin
    if (! $value$plusargs("uart_out_file=%s", uart_out_file)) begin
        uart_out_file="uart.out";
    end
end

integer uart_out_mode;
initial begin
    if (! $value$plusargs("uart_out_mode=%d", uart_out_mode)) begin
        uart_out_mode=2;
    end
end



logic _MR=0; // master reset

// Hardware testing demonstrates that if a read starts but no data has been received since the last read ended then the next receive will immediately update the data lines.
// This is only possible of course if one starts a read before RXF has gone low again to signal that new data is ready.
logic immedBusUpdateOnNextReceive=1; 

integer fOut=`NULL, fControl, c, r, txLength, tDelta;

localparam MAX_LINE_LENGTH=255;
reg [8*MAX_LINE_LENGTH:0] line; /* Line of text read from file */ 
reg _TXE_SUPPRESS; // purpose is actually to suppress readiness
reg _RXF_SUPPRESS; // purpose is actually to suppress readiness

string strInput = "";
integer iInput;

localparam BUFFER_SIZE=255;

byte rxBuf[BUFFER_SIZE]; // Line of text read from file 
int totalBytesReceived = 0; // next place to write
int totalBytesRead = 0; // next place to read

int REPORTING_INTERVAL=1000;
integer cycle_count=0;

wire #T11 unreadDataAvailable = totalBytesRead < totalBytesReceived;
wire spaceIsAvailable = (totalBytesReceived - totalBytesRead) < BUFFER_SIZE;

reg [7:0] Drx = 'x;

if (LOG>1)
    always @* begin
    $display("%9t UART:", $time, 
        " D=%8b", D, " WR=%1b", WR, " _RD=%1b", _RD, 
        " _RXF=%1b", _RXF, 
        " _TXE=%1b", _TXE, 
        " Drx=%8b", Drx,
        " BYTES_READ=%-3d", totalBytesRead,
        " BYTES_RECV=%-3d", totalBytesReceived,
        " RPOS=%-3d", totalBytesRead % BUFFER_SIZE,
        " WPOS=%-3d", totalBytesReceived % BUFFER_SIZE,
        " DAVAIL=%1b", unreadDataAvailable,
        " _TXE_SUPPRESS=%1b", _TXE_SUPPRESS, 
        " _RXF_SUPPRESS=%1b", _RXF_SUPPRESS
        );

    end

integer tx_count=0;

assign _TXE = !(fOut != `NULL && _TXE_SUPPRESS && tx_count > 0 && _MR);

//assign #T6 _RXF = !(unreadDataAvailable && _RXF_SUPPRESS && _MR);
assign  _RXF = !(unreadDataAvailable && _RXF_SUPPRESS && _MR);

assign #T3 D= _RD? 8'bzzzzzzzz: totalBytesReceived > 0 ? Drx : 8'bxzxzxzxz; // xzxzxzxz is a distinctive signal that we're reading uninitialised data

function [7:0] printable([7:0] c);
    if (uart_out_mode==`PRINTMODE_ASCII) begin
        if (c == 0) return 32;
        else if ($isunknown(c)) return 32; 
        else if (c < 32 && c != 12 && c != 13) return 32; // allow CR/LF
        else if (c >= 128) return 32;
    end
    if (uart_out_mode==`PRINTMODE_NOCTRL) begin
        if (c == 0) return 32;
        else if ($isunknown(c)) return 32; 
        else if (c < 32 ) return 32; 
        else if (c >= 128) return 32;
    end
    return c;
endfunction

/*
    Transmit only valid when _TXE is low.
    Transmit occurs when WR goes low.
*/
always @(negedge WR) begin
    if (_MR) begin
        if (_TXE) begin
            $display("%9t ", $time, "UART: ATTEMPT TRANSMITTING %8b WHEN NOT READY", D);
            $error("%9t ", $time, "UART: ERROR WR set low while _TXE not ready - Transmit ignored");
            if (EXIT_ON_BAD_TIMING == 1) `FINISH_AND_RETURN(1);
        end
        else
        begin
            // FIXME - DOUBLE CHECK THE HARDWARE - WHAT DOES IT DO IF WR IS BROUGHT LOW WHEN _TXE NOT READY - IS IT IGNORED?


            $display("%9t ", $time, "UART: TRANSMITTING [h:%02x] [c:%c] [b:%08b] [d:%1d]", D, printable(D), D, D);
        //    if (LOG) $display("%9t ", $time, "UART: TRANSMITTING h%02x (b=%08b)", D, D, D);

            if (uart_out_mode==`PRINTMODE_CHARS) begin
              $fwrite(fOut, "%c", D);
            end else begin
              $fwrite(fOut, "%02x\n", D);
            end

            $fflush(fOut);

            #T11 // -WR to _TXE inactive delay
            if (LOG>1) $display("%9t ", $time, "UART: TX NOT READY");
            _TXE_SUPPRESS=0; 

            tx_count --;
            if (tx_count < 0) begin
                $error("%9t ", $time, "UART: ERROR tx_count went negative");
                if (EXIT_ON_BAD_TIMING == 1) `FINISH_AND_RETURN(1);
            end

            #T12 // min inactity period
            if (LOG>1) $display("%9t ", $time, "UART: inactive period ends");
            _TXE_SUPPRESS=1;
        end

    end
end

/*
    Transmit only valid when _TXE is low.
    Transmit occurs when WR goes low.
*/
if (LOG) always @*  begin
    $display("%9t ", $time, "UART: _RD %1b _RXF %1b", _RD, _RXF);
end

always @(negedge _RD) begin
    if (_MR) begin
        if (_RXF) begin
                $display("%9t ", $time, "UART: ERROR _RD low while _RXF not ready");
                if (EXIT_ON_BAD_TIMING == 1) `FINISH_AND_RETURN(1);
        end

        if (! unreadDataAvailable) begin
                $display("%9t ", $time, "UART: ERROR _RD low while data not available");
                if (EXIT_ON_BAD_TIMING == 1) `FINISH_AND_RETURN(1);
        end

        // JL if (LOG>1) $display("%9t ", $time, "UART: READING AT %-d", totalBytesRead);
        // JL Drx = rxBuf[totalBytesRead%BUFFER_SIZE];

        if (LOG) $display("%9t ", $time, "UART: READING   %02x (%c) from buffer at pos %1d", Drx, printable(Drx), totalBytesRead);
    //    if (LOG) $display("%9t ", $time, "UART: RECEIVED   %02x from serial at pos %-d", Drx, Drx, totalBytesRead);
    end
end

logic _RD_prev;

always @(posedge _RD) begin
    if (_MR && !_RD_prev) begin
        if (_RXF) begin
                $display("%9t ", $time, "UART: ERROR _RD going high while _RXF not ready");
                if (EXIT_ON_BAD_TIMING == 1) `FINISH_AND_RETURN(1);
        end


        // FIXME: OUGHT TO BE T4 or T5 - CHECK OTHER TIMINGS
        #(T5) // -WR to _TXE inactive delay
        if (LOG>1) $display("%9t ", $time, "UART: RX NOT READY");
        _RXF_SUPPRESS=0;

        // only advance the read position at the END of the read otherwise _RXF goes high too early
        if (totalBytesRead < totalBytesReceived) begin
            if (LOG>1) $display("%9t ", $time, "UART: ADVANCING READ POS FROM %3d", totalBytesRead);
            totalBytesRead++;
        end else begin
            if (LOG>1) $display("%9t ", $time, "UART: NOT ADVANCING READ POS FROM %3d BECAUSE AT END OF BUFFER - will return last thing received", totalBytesRead);
            immedBusUpdateOnNextReceive=1;
        end

        Drx = rxBuf[totalBytesRead%BUFFER_SIZE];
        if (LOG>1) $display("%9t ", $time, "UART: BUFFER BYTE=%8b AT %-d", Drx, totalBytesRead);

        #(T6) // min inactity period
        if (LOG>1) $display("%9t ", $time, "UART: RX INACTIVE PERIOD ENDS");
        _RXF_SUPPRESS=1;

    end
end

always @*
    _RD_prev = _RD;



initial 
    begin : file_block 
    $timeformat(-9, 0, "ns", 6); 

    // gather inital value of _RD - it might be x
    _RD_prev = _RD;

    // fill buffer with garbage - rxBuf is type byte so can't be XZ
    for(int i=0; i<BUFFER_SIZE; i++) begin
        rxBuf[i] = 0;
    end

    _RXF_SUPPRESS=0; // suppressed/
    _TXE_SUPPRESS=0;

    #50 // arbitrary delay before device is available
    $display("%9t UART: RESET END",$time);
    _MR=1;
    _TXE_SUPPRESS=1; // unsuppressed
    _RXF_SUPPRESS=1;
    #50

    if (1) begin
        $display("%9t ", $time, "UART: opening %s", uart_control_file);
`ifndef verilator
        fControl = $fopenr(uart_control_file); 
`endif
        //fControl = $fopenr("/dev/stdin"); 
        if (fControl == `NULL) // If error opening file 
        begin
                $error("%9t ERROR ", $time, "failed opening file %s", uart_control_file);
                `FINISH_AND_RETURN(1);
                disable file_block; // Just quit 
        end

        $display("%9t ", $time, "UART: opening %s", uart_out_file);
`ifndef verilator
        fOut = $fopen(uart_out_file, "w"); 
`endif
        //fOut = $fopen("/dev/stdout", "w+"); 
        if (fOut == `NULL) // If error opening file 
        begin
                $error("%9t ERROR ", $time, "failed opening file %s", uart_out_file);
                `FINISH_AND_RETURN(1);
                disable file_block; // Just quit 
        end

        $display("%9t ", $time, "UART: files are open");

        while (fControl != `NULL)  
        begin
            c = $fgetc(fControl); 

            if (c != `EOF) 
            begin 
            //        cycle_count=1;
                    /* Check the first character for comment */ 
                    if (c == "/") // just skip
                    begin 
                        line="";
                        r = $fgets(line, fControl); 
                        strInput = strip(line);

                        $display("%9t ", $time, "UART: CONTROL /%s", strInput);
                    end

                    // x - read a hex value, r read a de value
                    if (c == "x" || c == "r") // pass string back to simulatiom
                    begin
                        line="";
                        r = $fgets(line, fControl); 
                        strInput = strip(line);

                        if (c == "x") begin
                            r = $sscanf(strInput, "%02x", iInput);
                            if (r == 0) begin
                                $display("%9t ", $time, "UART: CONTROL RX: '%s' can't convert %s from hex", strInput, strInput);
                            end
                            $sformat(strInput, "%c", iInput);
                        end

                        $display("%9t ", $time, "UART: RECEIVED '%s'", strInput);

                        if (LOG>1)
                        $display("%9t ", $time, "UART: CONTROL RX: '%s' into ringpos=%3d totalBytesReceived=%3d, spaceIsAvailable=%1b", 
                                                                strInput, totalBytesReceived%BUFFER_SIZE, totalBytesReceived, spaceIsAvailable);

                        for (int p=0; p<strInput.len() && spaceIsAvailable; p++) begin
                            if (LOG) $display("%9t ", $time, "UART: FILL BUFFER[%1d] = %2x",  totalBytesReceived%BUFFER_SIZE, strInput[p]);
                            rxBuf[totalBytesReceived%BUFFER_SIZE] = strInput[p];
                            totalBytesReceived++;
                        end
                        if (! spaceIsAvailable)
                            $display("%9t ", $time, "UART: CONTROL RECEIVE BUFFER NOW FULL");

                        if (immedBusUpdateOnNextReceive) begin
                            if (LOG>1) $display("%9t ", $time, "UART: CONTROL POS FROM %3d BECAUSE AT END OF BUFFER", totalBytesRead);
                            Drx = rxBuf[totalBytesRead%BUFFER_SIZE];
                        end

                        if (LOG>1) 
                            $display("%9t ", $time, "UART: CONTROL RECEIVE totalBytesReceived %3d, totalBytesRead=%3d", totalBytesReceived, totalBytesRead);
                    end
                    
                    if (c == "t") // permit simulation to transmit N chars
                    begin
                        txLength=0;

                        line="";
                        r = $fgets(line, fControl);  // consumes the line ending and space chars 
                        r = $sscanf(line,"%d\n", txLength); 

                        if (LOG>1) $display("%9t ", $time, "UART: CONTROL TX: waiting for %1d chars", txLength);
                        tx_count = txLength;
                    end
                    
                    if (c == "#") // sleep N ns
                    begin
                        tDelta=0;
                        line="";
                        r = $fgets(line, fControl);  // consumes the line ending and space chars 
                        r = $sscanf(line,"%d\n", tDelta); 

                        if (LOG>1) $display("%9t ", $time, "UART: CONTROL #%1d delay begin", tDelta);
                        #tDelta 

                        if (LOG>1) $display("%9t ", $time, "UART: CONTROL #%1d delay end", tDelta);
                    end

                    if (c == "q") // quit
                    begin
                        r = $fgets(line, fControl);  // consumes the line ending and space chars 
                        $display("%9t ", $time, "UART: CONTROL QUIT");
                        `FINISH_AND_RETURN(0);
                    end

                    if (c == "\n") // quit
                    begin
                        $display("%9t ", $time, "");
                    end

            end
            else
            begin
                // allow time to advance
                #10000
                cycle_count++;
                if (cycle_count > REPORTING_INTERVAL) begin
                    $display("UART - read nothing for %d iterations", REPORTING_INTERVAL);
                    REPORTING_INTERVAL= 10000;
                    cycle_count=0;
                end

            end
        end // while
    end
end // initial

endmodule

`endif
