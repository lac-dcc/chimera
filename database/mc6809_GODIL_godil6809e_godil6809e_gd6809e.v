`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:47 09/23/2016 
// Design Name: 
// Module Name:    gd6809e 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module gd6809e(
    input   fpgaclk,
    inout   [7:0] D,
    inout   [15:0] A,
    inout   RnW,
    input   E,
    input   Q,
    output  BS,
    output  BA,
    input   nIRQ,
    input   nFIRQ,
    input   nNMI,
    output  AVMA,
    output  BUSY,
    input   TSC,
    output  LIC,
    input 	nHALT,	 
    input   nRESET
    );
    
    // Get a much faster clock than the XTAL on the GODIL board for filtering and delaying 
    // precisely
    wire fpga6x;
    wire oscclk;

// Instantiate the module
godil_clk clkgen (
    .CLKIN_IN(fpgaclk), 
    .USER_RST_IN(0), 
    .CLKFX_OUT(fpga6x), 
    .CLKIN_IBUFG_OUT(oscclk)
    );

    
    wire         wTristated = (BA | TSC);
    
    
    // Generate a Power On Reset; 6809 says '1 cycle minimum', 4 is just spiffy.
    reg  [1:0]   PORCount;
    reg          nPOR;

    // The /RESET signal we send to the core needs to be carefully filtered, as the 6809's trigger on /RESET is 4V, not the typical TTL 2V.  
    // Otherwise, we'll come out of RESET likely before anyone else. 
    localparam   MINIMUM_RESET_SETTLE_CLOCKS=13'H1000;
    reg          rnRESET;
    reg   [12:0] RESETReleaseCount;


    reg          QLatch;
    reg   [23:0] EDelay;
    
    reg   [15:0] AOutLatched;
    reg          RnWOutLatched;
    reg    [7:0] DOutLatched;
    
    reg          NMILatch;

    
    // Tristatable Address Bus
    genvar gab;
    generate
    for (gab=  0; gab < 16; gab =  gab + 1)
    begin : godilabus
        assign  A[gab]  =  ~wTristated ? AOutLatched[gab] : 1'bZ;
    end
    endgenerate

    reg    RnWBusControl;

    assign RnW = wTristated ? 1'bZ : RnWOutLatched;
    

    
    wire  [15:0] AFromCPU;
    wire         RnWFromCPU;
    wire  [7:0]  DOut;
    
    initial
    begin
        PORCount = 2'b00;
        nPOR = 1'b0;
        rnRESET = 1'b0;
        RESETReleaseCount = 13'H0000;
    end


    wire EFilterSrc = EDelay[1] & EDelay[0] & E; // Just slightly delayed from E; a BUFG delay primarily.  
    wire EFilterBusSrc = EDelay[23]; // This is roughly 75ns of delay from E.
    wire EFilterAddrSrc = EDelay[10]; // Roughly 35ns
    wire EFilterBusRnWSrc = EDelay[14]; // Roughly 50ns

    wire    EFilter;
    BUFG    CLKB_EF(  .I(EFilterSrc),
                      .O(EFilter));
    
    wire    EFilterBus;
    BUFG    CLKB_EFB( .I(EFilterBusSrc),
                      .O(EFilterBus));  

    wire    EFilterAddr;
    BUFG    CLKB_EFA( .I(EFilterAddrSrc),
                      .O(EFilterAddr));

    wire    EFilterBusRnW;
    BUFG    CLKB_EFBRW( .I(EFilterBusRnWSrc),
                        .O(EFilterBusRnW));


    assign D = (wTristated | RnWBusControl) ? 8'HZZ : DOutLatched;
    
    always @(posedge fpga6x)
    begin
        // I see Ringing on E on the GODIL, likely due to the high drive characteristics of E on many systems.
        // That forces me to do filtering to eliminate the glitches that otherwise appear.  I've only ever
        // seen ringing after a falling edge [the rising edge is likely happening as well, but with a LVTTL
        // 2.0V high signal and E driven to 5V, it's likely happening and retaining a logic 1 the entire time].
        // Thus, I filter out sampled clock pulses that are shorter than 3 samples in width (3.39ns * 3).  This
        // has an unfortunate effect of delaying (and shortening) E by the same amount of time, and while Q is latched,
        // it isn't equally delayed.  Thus, in a relative sense, the core sees 'Q' slightly early in the sense
        // of quadrature.  
        //
        // I admit that I removed the filtering several times before eventually giving up and leaving it in here;
        // too many times I struggled with chaos before finding a very short 'E' pulse made it to the CPU core
        // before the core had time to actually do anything.  Thus, it stays on.  :|
        //
        EDelay[0] <= E;
        EDelay[1] <= EDelay[0] & E;
        EDelay[2] <= EDelay[1] & EDelay[0] & E;
        EDelay[23:3] <= EDelay[22:2];
        QLatch <= Q;
        NMILatch <= nNMI;
    end
    
    // Latch RnW and the Address bus from the CPU
    always @(negedge EFilterAddr)
    begin
        AOutLatched <= AFromCPU;
        RnWOutLatched <= RnWFromCPU;
    end
    
    // Latch a copy of RnW from the CPU; this is intentionally after the latch above; the intent is to
    // copy 6809 behavior where the RnW output actually doesn't match identically the Data Bus behavior,
    // and write data can be held for a few nanoseconds even though RnW might be high.
    // (Yes, I put a 6809 on an analyzer, as well as a 6309 to note that they had that characteristic.)
    always @(negedge EFilterBusRnW)
    begin
        RnWBusControl <= RnWFromCPU;
    end
    
    // Much later, latch the Data bus *OUTPUT* from the CPU.
    always @(negedge EFilterBus)
    begin
        DOutLatched <= DOut;
    end
    
    // Generate a Power On Reset
    always @(negedge EFilter)
    begin
        if (PORCount != 2'b11)
        begin
            nPOR = 1'b0;
            PORCount <= PORCount + 2'b01;
        end
        else
            nPOR = 1'b1;
    end

    // The 6809 has a very high VIH for /RESET; 4V.  That isn't detectable in a 3.3V LVTTL.  
    // The design intent was to ensure that the 6809 left RESET last - after peripheral components.
    //
    // Since a 4V level can't be detected here, to achieve the same thing - to try to ensure
    // that the CPU doesn't come out of RESET before the peripherals (as it'll be quite disappointed if
    // it does - accesses to different addresses, depending on architecture, just wouldn't work) - 
    // we end up having to do something different.
    //
    // We could rewire the GODIL to detect the 4V trigger, but that defeats the point.
    //
    // Instead, we stall the signal while also doing debouncing on it.  
    //
    // Any '0' on the input signal causes the value we send to the core to go to 0.
    // Once we begin seeing '1's we need to see '1's for N cycles in a row before we accept that reset is released.
    // This provides debounce (for those systems using a pushbutton) and an admittedly rough estimation of when we should
    // let the core out of /RESET so that other hardware isn't still RESET when the CPU exits the state.
    //
    always @(negedge EFilter)
    begin
        if (nRESET == 0)
        begin
            rnRESET <= 1'b0;
            RESETReleaseCount <= MINIMUM_RESET_SETTLE_CLOCKS;            
        end
        else
        begin
//            if ((rnRESET == 0) && (nRESET == 0))
//                RESETReleaseCount <= MINIMUM_RESET_SETTLE_CLOCKS;
//            else 
            if ((rnRESET == 0) && (nRESET == 1))
            begin
                RESETReleaseCount <= RESETReleaseCount - 1'b1;
                if (RESETReleaseCount == 13'H0001)
                    rnRESET <= 1'b1;
            end
        end
    end
    
    
    wire nRESETPlusPOR = (rnRESET & nPOR);       // 0 if either are low, 1 otherwise.
    

    
mc6809e cpu(.D(D), .DOut(DOut), .ADDR(AFromCPU), .RnW(RnWFromCPU), .E(EFilter), .Q(QLatch), .BS(BS), .BA(BA), .nIRQ(nIRQ), .nFIRQ(nFIRQ), 
            .nNMI(NMILatch), .AVMA(AVMA), .BUSY(BUSY), .LIC(LIC), .nHALT(nHALT), .nRESET(nRESETPlusPOR) 
            );


endmodule
