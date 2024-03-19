`include "shift_reg_4bit_lab.v"     //in, en, q, clk
`include "fullAdder1bit.v"
`include "dff_async_clear.v"        //d, clear, clk, q

module serialAdder_4bit( 
    output [3:0] serOut1,
    output sm,
    input serInp,
    input shiftCtrl,
    input clear,
    input clk);

    wire cout, coutLatched, sm;
    wire [3:0] serOut1, serOut2;

    shift_reg_4bit_lab sreg1( sm, shiftCtrl, serOut1 , clk );
    shift_reg_4bit_lab sreg2( serInp, shiftCtrl, serOut2 , clk );
    
    fullAdder1bit fa( serOut1[0] , serOut2[0] , coutLatched, sm, cout );
    
    dff_async_clear dff(cout, clear, shiftCtrl & clk, coutLatched);


endmodule