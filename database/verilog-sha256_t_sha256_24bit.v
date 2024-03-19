/*****************************************************************************/
/*   SHA 256 module testbench, 24bit version                                 */ 
/*   Aishwarya Nagarajan, UW-Madison, ERCBench Researcher                    */
/*   Inputs: clk, rst, valid, msg_in (24bits)                                */
/*   Outputs: ready, msg_out (256 bits)                                      */
/*****************************************************************************/

//declaring module
module t_sha256_24bit_in();
   
   //declaring input and output regs and wires
   reg clk, rst, valid;
   reg [23:0] msg_in;
   wire [255:0] msg_out; 
   wire ready;
   reg [255:0] expected; 
   reg error; 
   
   //instantiating UUT 
   sha256_24bit_in UUT (clk, rst, valid, msg_in, msg_out, ready);
   
   //defining clock
   initial clk=1'b0;
   always @(clk) clk <= #5 ~clk;

   //assigning 24bit input along with valid signal
   initial begin
       rst = 1'b1; //initial reset signal
       valid = 1'b0;
       #11 rst = 1'b0;
       #10 valid = 1'b1;
       msg_in = 24'b01100001_01100010_01100011;
       expected = 256'd84342368487090800366523834928142263660104883695016514377462985829716817089965;
       #640
       valid = 1'b0;
       #10 msg_in = 24'b00000000_00000000_00000000;
       valid = 1'b1;
       expected = 256'd50939089707039561855951696553837273811667445504240142649131300049596110607484; 
       #640 msg_in = 24'b11111111_11111111_11111111;
       expected = 256'd41117889871236726907521812950601057416742407426159436078621859948139705775948;
       #640
       msg_in = 24'b11000011_10101010_00001111;
       expected = 256'd2725095263692071247372713662521109487960121601722515526735893664157849457902;
       #640
       msg_in = 24'b11111111_00000000_11111111;
       expected = 256'd18839237710372717045753194038482107863829376088214190112393872440534323569225;
       #640
       msg_in = 24'b00000000_11111111_00000000;
       expected = 256'd20150944628864241550288628450335594792734713644354451178336661183263637451027;
       #640
       msg_in = 24'b11100010_00011101_01010101;
       expected = 256'd64241978614678690342693273108970513168044140687004728334648021546877428356436;
       #640
       msg_in = 24'b01111110_10000001_11110101;
       expected = 256'd18232687119228583880544445613621690048117345850643623080209843122651496554430;
       #640
       msg_in = 24'b01101001_01101001_01101001;
       expected = 256'd110967694773382301601332111520641443554748404114778661478289601390792109329328;
       #640
       msg_in = 24'b11000011_00111100_11001100;
       expected = 256'd106512235356151736050753033834386749889504334895888099399188114956855501795707;

   end  
   
   always@(expected, msg_out, ready) begin
       if (ready&&(expected != msg_out)) begin
           error = 1'b1;
       end
       else begin
           error = 1'b0; 
       end
   end
   
   initial begin
       #30000 $stop; 
   end
   
endmodule

