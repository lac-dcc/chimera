// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_Decoder
#(
    /*RAMCODE enable parameter*/
    parameter Port0_en = 1,
    /************************/

    /*WaterLight enable parameter*/
    parameter Port1_en = 1,
    /************************/

    /*RAMDATA enable parameter*/
    parameter Port2_en = 1,
    /************************/

    /*UART enable parameter*/
    parameter Port3_en = 1
    /************************/
)(
    input [31:0] HADDR,

    /*RAMCODE OUTPUT SELECTION SIGNAL*/
    output wire P0_HSEL,

    /*WaterLight OUTPUT SELECTION SIGNAL*/
    output wire P1_HSEL,

    /*RAMDATA OUTPUT SELECTION SIGNAL*/
    output wire P2_HSEL,

    /*UART OUTPUT SELECTION SIGNAL*/
    output wire P3_HSEL       
);

//RAMCODE-----------------------------------

//0x00000000-0x0000ffff
/*Insert RAMCODE decoder code there*/
assign P0_HSEL = (HADDR[31:16] == 16'h0000) ? Port0_en : 1'b0; 
/***********************************/



//PERIPHRAL-----------------------------

//0X40000000 WaterLight MODE
//0x40000004 WaterLight SPEED
/*Insert WaterLight decoder code there*/
assign P2_HSEL = (HADDR[31:4] == 28'h4000000) ? Port2_en : 1'b0; 
/***********************************/

//0X40000010 WaveformGenerator enable signal
/*Insert WaveformGenerator decoder code there*/
assign P3_HSEL = (HADDR[31:4] == 28'h4000001) ? Port3_en : 1'b0;
/***********************************/

//RAMDATA-----------------------------
//0X20000000-0X2000FFFF
/*Insert RAMDATA decoder code there*/
assign P1_HSEL = (HADDR[31:16] == 16'h2000) ? Port1_en : 1'b0;
/***********************************/

endmodule