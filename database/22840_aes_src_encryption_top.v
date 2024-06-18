// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*   Author: Ahmad Hegazy <https://github.com/ahegazy>
*	Date: September 2018
*   FORMAL: MAY 2020
*
* Description: AES Encryption Top module using FSM to move around the processes' steps.
* Language: Verilog
*
*/
module AES_encryption
(
input [7:0] key_byte, state_byte,
input clk,reset,enable,
output reg [7:0] state_out_byte,
output reg load,ready
);

	integer i,j;
	reg [1:0] encryptionCycleFSM;
	reg [1:0] dataioFSM;
	reg [127:0] key, state; /* input */
	reg roundKeyEn,shiftRowsEn,mixColumnsEn,keyExpansionEn;
	wire roundKeyFinish,shiftRowsFinish,mixColumnsFinish;
	reg  finish;
	reg [127:0] modulesStateIn, stateOutput;
	reg [127:0] modulesKeyIn;
	wire [127:0] keyExpansionOut,roundKeyStateOut,subByteStateOut,shiftRowsStateOut,mixColumnsStateOut;
	reg [3:0] keyNum;
	reg loadFinish;

	addRoundKey addRoundKeyInst(.key(modulesKeyIn),.state(modulesStateIn),.clk(clk),.reset(reset),.enable(roundKeyEn),.state_out(roundKeyStateOut),.done(roundKeyFinish));

  genvar itr;
	generate
		for (itr = 0 ; itr <= 127; itr = itr+32)
			subByte subByteInst (.state(roundKeyStateOut[itr +:32]) , .state_out(subByteStateOut[itr +:32]));
	endgenerate
	
	shiftRows shiftRowsInst (.enable(shiftRowsEn),.clk(clk),.reset(reset),.Data(subByteStateOut),.Shifted_Data(shiftRowsStateOut),.done(shiftRowsFinish) );
	mixColumns mixColumnsInst (.state(modulesStateIn),.clk (clk),.enable(mixColumnsEn), .reset(reset),.state_out(mixColumnsStateOut),.done(mixColumnsFinish));

	singleKeyExpansion singleKeyExpansionInst ( .keyInput(modulesKeyIn),.clk (clk),.enable(keyExpansionEn),.reset (reset),.keyNum (keyNum),.keyOutput(keyExpansionOut));


    initial load <= 1'b0;
    initial ready <= 1'b0;
    initial state_out_byte <= 8'h00;


    // 1st FSM (dataioFSM) for 
    // state 0 : wait for the enable signal 
    // state 1 : recieving the data,key byte by byte and store them in a 128 bit registers 
    // state 2 : send the ready signal when finish
    // state 3 : send the data out byte by byte
always @(posedge clk)
	begin 
		if (reset) 
		begin
			loadFinish <= 0;
			key<=128'd0;
			state<=128'd0;
			load<=1'd0;
			ready<=1'd0;
			i <= 128;
			state_out_byte <= 8'h00;
			j <= 128; 
			dataioFSM <= 0 ;
		end 
		else if (enable) 
		begin

		case(dataioFSM)
			0:
			begin 
				/* state zero, the enable signal arrived, begin recieving data */
				dataioFSM <= 1;
				i <= 128;
                loadFinish <= 0;
			end 
			1:
			begin 
				/* receivng data 1 byte at a cycle */
				if (i>0) begin				
					load<=1'd1; /* send the load signal then begin loading next cycle*/
					loadFinish <= 0;
					key[i-1 -: 8]<=key_byte;
					state[i-1 -: 8]<=state_byte;
					i<=i-8;				
				end 
				else  
					begin 
					/* loading data finished go to state 2, processing */
					load<=1'd0;
					loadFinish <= 1;
					dataioFSM <= 2; 
					end
			end
			2: begin 
				/* processing data, wait for finish signal */
					if(finish)
					begin
					/* send ready signal, then go to state three sending output bytes */
						ready <= 1;
						dataioFSM <= 3;
						j <= 128;
						loadFinish <= 0;
					end else 
                        begin
                            ready <= 0;
                            dataioFSM <= 2; 
                        end
			end 
			3: begin
						/* state 3 send encrypted data byte by byte .. */
						if ( j > 0)
						begin
							ready <= 1; 
							state_out_byte <= stateOutput [j-1 -: 8]; 
							j <= j - 8;
						end 
						else begin 
								/* encryption finished, go to state 0 */
								ready <= 0;
								dataioFSM <= 0;
						end 
                        loadFinish <= 0;
			end 
			
			endcase
		end else dataioFSM <= 0; /* end if enable */
end 



    // 2nd FSM (encryptionCycleFSM) for running the encryption 10 cycles (provide inputs and enable signals to the modules )  
    // state 0 : wait for the load finish signal to come then run the 1st AddroundKey key 0 
    // state 1 : run shift rows 
    // state 2 : run mix columns 
    // state 3 : run AddRoundKey for the rest of the steps

    // I store a counter of the key number calculated in keyNum register
    // When it reaches 11, then we finished all the steps
    // produce the output

    initial 
    begin 
		keyNum <= 0;
		encryptionCycleFSM <= 0;
		mixColumnsEn <= 0;
		keyExpansionEn <= 0;
		roundKeyEn <= 0;
		shiftRowsEn <= 0;
		stateOutput <= 0;
		finish <= 0;
	end
always @(posedge clk)
	begin 
	if (reset)
	begin 
		keyNum <= 0;
		encryptionCycleFSM <= 0;
		mixColumnsEn <= 0;
		keyExpansionEn <= 0;
		roundKeyEn <= 0;
		shiftRowsEn <= 0;
		stateOutput <= 0;
		finish <= 0;
	end
	else if( (enable == 1 ) && (loadFinish == 1))
	begin 
			if ( keyNum <= 11 )
			begin 
		/* get here only if the device is enabled and not loading */
			/* FSM */
			case (encryptionCycleFSM)
				2'b00:
					begin 
					/* round 0 AddroundKey only .. */
							modulesKeyIn <= key;
							modulesStateIn <= state;
							keyNum <= 4'h1;
							roundKeyEn <= 1;
                            mixColumnsEn <= 0; // disable mix column 
                            shiftRowsEn <= 0; // disalbe shift rows
							keyExpansionEn <= 1; // enable key expansion to do the 1st key expansion 
							encryptionCycleFSM <= 2'b01;
							finish <= 0;
					end 
				2'b01:
					begin 
					/* round 1 shiftrows */
						if (roundKeyFinish == 1)
						begin
							modulesStateIn <= roundKeyStateOut;
							modulesKeyIn <= keyExpansionOut;
							keyExpansionEn <= 0;
							roundKeyEn <= 0;
							shiftRowsEn <= 1;
							if ( keyNum < 10)  encryptionCycleFSM <= 2'b10; // if we reached the last cycle don't mix columns
							else encryptionCycleFSM <= 2'b11; // go to addRoundKey directly 
						end 			
						finish <= 0;
					end 
				2'b10:
				begin
					/* round 1 MixColumns */
						if (shiftRowsFinish == 1)
						begin
							modulesStateIn <= shiftRowsStateOut;
							shiftRowsEn <= 0;
							mixColumnsEn <= 1;
							encryptionCycleFSM <= 2'b11;
						end 
						finish <= 0;
				end 
				2'b11:
				begin 
					/* round AddroundKey */
						if (mixColumnsFinish == 1 || (shiftRowsFinish == 1 && keyNum >= 10))
						begin
						  if(keyNum < 10) modulesStateIn <= mixColumnsStateOut;
							else 	modulesStateIn <= shiftRowsStateOut;
							mixColumnsEn <= 0;
							shiftRowsEn <= 0;
							keyExpansionEn <= 1;
							roundKeyEn <= 1;
							encryptionCycleFSM <= 2'b01; // return to state 1 shift rows
							keyNum <= keyNum + 1;
						end 
						finish <= 0;
				end 
//				default: 
				endcase 		
				end 
				else 
				begin 
					/* keyNum > 10 */
					stateOutput <= roundKeyStateOut;
					finish <= 1;
					keyNum <= 0;
					encryptionCycleFSM <= 0;
					mixColumnsEn <= 0;
					keyExpansionEn <= 0;
					roundKeyEn <= 0;
					shiftRowsEn <= 0;
				end 
		end else 
		begin
			keyNum <= 0;
			encryptionCycleFSM <= 0;
			mixColumnsEn <= 0;
			keyExpansionEn <= 0;
			roundKeyEn <= 0;
			shiftRowsEn <= 0;
			finish <= 0;
		end
		

		end 


`ifdef FORMAL

    reg f_past_valid; // to know if the $past value is valid to process
    initial f_past_valid = 0;

    initial assume(reset);


    always @(posedge clk)
        f_past_valid = 1;

    // sync reset
    // the design starts at reset state so if no f_past_valid it should be on reset
    // if the past cycle had reset then it should be in reset state
    always @(posedge clk)
        if(!f_past_valid || $past(reset))
        begin
            assert(state_out_byte == 8'd0);
            assert(load == 1'b0);
            assert(ready == 1'b0);
        end


    // sync enable

    // enable signal should be up for the circuit to work  
    always @(posedge clk)
        assume(enable);
 
    // assume never reset 
//    always @(posedge clk)
//        assume(!reset);

    // check that not all modules enabled at the same time 
    always @(*)
        if(roundKeyEn)
        begin
            assert(!shiftRowsEn);
            assert(!mixColumnsEn);
        end
    
    always @(*)
        if(mixColumnsEn)
        begin
            assert(!roundKeyEn);
            assert(!shiftRowsEn);
        end
    
    always @(*)
        if(shiftRowsEn)
        begin
            assert(!roundKeyEn);
            assert(!mixColumnsEn);
        end
    
    // when finish check if the ready flag is raised for the out to receive the data
    always @(posedge clk)
        if(f_past_valid && $past(finish) == 1'b1 && !$past(reset))
            assert(ready);


/*
    // assume an intermediate state after getting the inputs
    (* anyconst *) wire [127:0] keyInt;
    (* anyconst *) wire [127:0] stateInt;

    reg stateAssumed;
    initial stateAssumed = 0;

    always @(posedge clk)
        if(f_past_valid)
        begin
            assume(key == keyInt);
            assume(state == stateInt);
        end
    always @(posedge clk)
        if(f_past_valid && !stateAssumed)
        begin
            //assume(load==1'b0);
            assume(loadFinish == 1'b1);
            assume(dataioFSM == 2'd2);
            stateAssumed <= 1'b1;
        end
*/
    // maximum generated keys 10
    always @(*)
        assert(keyNum <= 12);


    //key num should be increased by 1
    // each time single key expansion module is enabled (keyExpansionEn) the keyNum must be increased by one
    always @(posedge clk)
        if(f_past_valid && keyNum > 0 && $rose(keyExpansionEn) && !$past(reset))
            assert(keyNum == $past(keyNum)+1);
`endif


endmodule
