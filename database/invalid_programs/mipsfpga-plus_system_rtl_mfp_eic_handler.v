/* Simple external interrupt controller for MIPSfpga+ system 
 * managed using AHB-Lite bus
 * Copyright(c) 2017 Stanislav Zhelnio
 */

`include "mfp_eic_core.vh"

 // determines the software handler params send to CPU from irqNumber
// (irqNumber -> EIC_Offset, EIC_Interrupt, EIC_Vector, EIC_ShadowSet)
module handler_params_encoder
(
    input      [  7 : 0 ] irqNumber,
    input                 irqDetected,
    
    output     [ 17 : 1 ] EIC_Offset,
    output     [  3 : 0 ] EIC_ShadowSet,
    output     [  7 : 0 ] EIC_Interrupt,
    output     [  5 : 0 ] EIC_Vector
);
    assign EIC_ShadowSet = 4'b0;

    // requested interrupt priority level
    // a value of 0 indicates that no interrupt requests are pending
    assign EIC_Interrupt = irqDetected ? irqNumber + 1  : 8'b0;

    `ifdef EIC_USE_EXPLICIT_VECTOR_OFFSET

        // EIC Option 2 - Explicit Vector Offset
        // for details see the chapter 5.3.1.3 in 
        // 'MIPS32® microAptiv™ UP Processor Core Family Software User’s Manual, Revision 01.02'
        //
        // to use this option set 'assign eic_offset = 1'b1;' in m14k_cpz_eicoffset_stub.v

        parameter HANDLER_BASE  = 17'h100;
        parameter HANDLER_SHIFT = 4;

        assign EIC_Offset    = HANDLER_BASE + (irqNumber << HANDLER_SHIFT);
        assign EIC_Vector    = 6'b0;
    `else

        // EIC Option 1 - Explicit Vector Number
        // for details see the chapter 5.3.1.3 in 
        // 'MIPS32® microAptiv™ UP Processor Core Family Software User’s Manual, Revision 01.02'
        //
        // to use this option set 'assign eic_offset = 1'b0;' in m14k_cpz_eicoffset_stub.v (default value)

        assign EIC_Offset    = 17'h0;
        assign EIC_Vector    = irqNumber[5:0];
    `endif

endmodule

// get current handled by CPU irqNumber
// used by auto clear option
// (irqVector, irqOffset -> irqNumber)
module handler_params_decoder
(
    input      [  5 : 0 ] irqVector,  //current interrupt vector number
    input      [ 17 : 1 ] irqOffset,  //current interrupt offset number
    output     [  7 : 0 ] irqNumber   //current interrupt number
);
    `ifdef EIC_USE_EXPLICIT_VECTOR_OFFSET
        
        parameter HANDLER_BASE  = 17'h100;
        parameter HANDLER_SHIFT = 4;

        assign irqNumber = ((irqOffset - HANDLER_BASE) >> HANDLER_SHIFT);
    `else

        assign irqNumber = {2'b0, irqVector };
    `endif

endmodule