// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

`timescale 1ns/10ps
module control_unit(
    output reg PCout, 
	MDRout, 
	Zhighout, 
	Zlowout, 
	HIout, 
	LOout, 
	Rin, 
	Rout, 
	Gra, 
	Grb, 
	Grc, 
	HIin, 
	LOin, 
	PCin, 
	IRin, 
	Yin, 
	Zlowin, 
	Zhighin,
	MARin, 
	MDRin, 
	OutportIn, 
	Cout, 
	BAout, 
	wren, 
	enableInport, 
	Run, 
	InPortout, 
	Clear,
	ctrl,
	IncPC,
	read,
	conInput, 
	outPortEnable, 
	conOut,
	
	//ADD ALL STUFF FROM BELOW IN THE INPUTS
   input [31:0] IR,
   input Clock, Reset, Stop
);

parameter   Reset_state= 8'b00000000, 
			fetch0 = 8'b00000001, 
			fetch1 = 8'b00000010, 
			fetch2= 8'b00000011,
			add3 = 8'b00000100, 
			add4= 8'b00000101, 
			add5= 8'b00000110, 
			addi3 = 8'b00000111,
			addi4 = 8'b00001000,
			addi5 = 8'b00001001,
			and3 = 8'b00001010, 
			and4 = 8'b00001011, 
			and5 = 8'b00001100,
			andi3 = 8'b00001101, 
			andi4 = 8'b00001110, 
			andi5 = 8'b00001111, 
			br3 = 8'b00010000, 
			br4 = 8'b00010001, 
			br5 = 8'b00010010, 
			br6 = 8'b00010011, 
			br7 = 8'b00010100, 
			div3 = 8'b00010101,
			div4 = 8'b00010110,
			div5 = 8'b00010111,
			div6 = 8'b00011000,
			in3 = 8'b00011001,
			jal3 = 8'b00011010,
			jal4 = 8'b00011011,
			jr3 = 8'b00011100,
			ld3 = 8'b00011101, 
			ld4 = 8'b00011110, 
			ld5 = 8'b00011111, 
			ld6 = 8'b00100000, 
			ld7 = 8'b00100001, 
			ldi3 = 8'b00100010, 
			ldi4 = 8'b00100011, 
			ldi5 = 8'b00100100, 
			mflo3 = 8'b00100101,
			mfhi3 = 8'b00100110,
			mul3 = 8'b00100111, 
			mul4 = 8'b00101000, 
			mul5 = 8'b00101001, 
			mul6 = 8'b00101010, 
			neg3 = 8'b00101011, 
			neg4 = 8'b00101100, 
			neg5 = 8'b00101101, 
			not3 = 8'b00101110,
			not4 = 8'b00101111, 
			not5 = 8'b00110000, 
			or3 = 8'b00110001, 
			or4 = 8'b00110010, 
			or5 = 8'b00110011,  
			ori3 = 8'b00110100, 
			ori4 = 8'b00110101, 
			ori5 = 8'b00110110,
			out3 = 8'b00110111,
			rol3 = 8'b00111000, 
			rol4 = 8'b00111001, 
			rol5 = 8'b00111010, 
			ror3 = 8'b00111011,
			ror4 = 8'b00111100, 
			ror5 = 8'b00111101, 
			shl3 = 8'b00111110, 
			shl4 = 8'b00111111, 
			shl5 = 8'b01000000, 
			shr3 = 8'b01000001,
			shr4 = 8'b01000010, 
			shr5 = 8'b01000011, 
			st3 = 8'b11111111, 
			st4 = 8'b01000100,
			st5 = 8'b01000101, 
			st6 = 8'b01000110, 
			st7 = 8'b01000111, 
			sub3 = 8'b01001000, 
			sub4 = 8'b01001001, 
			sub5 = 8'b01001010,
			nop3 = 8'b01001011,
			halt3 = 8'b01001100;

reg		[7:0] Present_state = Reset_state;

always @(posedge Clock, posedge Reset, posedge Stop) 
	begin
		if (Reset == 1'b1) Present_state = Reset_state;
		if (Stop == 1'b1) Present_state = halt3;
		else case (Present_state)
			Reset_state		:	Present_state = fetch0;
			fetch0			:	#45 Present_state = fetch1;
			fetch1			:	#45 Present_state = fetch2;
			fetch2			:	begin	
    
            @(posedge Clock);
				    case	(IR[31:27])
					5'b00011		:		Present_state=add3;	
					5'b00100		: 		Present_state=sub3;
					5'b01110		:		Present_state=mul3;
					5'b01111		:		Present_state=div3;
					5'b00101		:		Present_state=shr3;
					5'b00110		:		Present_state=shl3;
					5'b00111		:		Present_state=ror3;
					5'b01000		:		Present_state=rol3;
					5'b01001		:		Present_state=and3;
					5'b01010		:		Present_state=or3;
					5'b10000		:		Present_state=neg3;
					5'b10001		:		Present_state=not3;
					5'b00000		:		Present_state=ld3;
					5'b00001		:		Present_state=ldi3;
					5'b00010		:		Present_state=st3;
					5'b01011		:		Present_state=addi3;
					5'b01100		:		Present_state=andi3;
					5'b01101		:		Present_state=ori3;
					5'b10010		:		Present_state=br3;
					5'b10011		:		Present_state=jr3;
					5'b10100		:		Present_state=jal3;
					5'b10111		:		Present_state=mfhi3;
					5'b11000		:		Present_state=mflo3;
					5'b11001		:		Present_state=nop3;
					5'b11010		:		Present_state=halt3;
				endcase
			end
            
			add3				: 	Present_state = add4;
			add4				:	Present_state = add5;
			add5 				:	Present_state = fetch0;
			
			addi3				: 	Present_state = addi4;
			addi4				:	Present_state = addi5;
			addi5 				:	Present_state = fetch0;

			and3				: 	Present_state = and4;
			and4				: 	Present_state = and5;
			and5   		    	:	Present_state = fetch0;

            andi3				: 	Present_state = andi4;
			andi4				: 	Present_state = andi5;
			andi5 			    :	Present_state = fetch0;
			
            br3			    	: 	Present_state = br4;
			br4			    	: 	Present_state = br5;
			br5			    	: 	Present_state = br6;
			br6  				:	Present_state = br7;
			br7  				:	Present_state = fetch0;
			
			div3				: 	Present_state = div4;
			div4				: 	Present_state = div5;
			div5				: 	Present_state = div6;
			div6				:	Present_state = fetch0;
	
			in3 				:	Present_state = fetch0;
            			
			jal3				: 	Present_state = jal4;
			jal4 				:	Present_state = fetch0;
			
			jr3 				:	Present_state = fetch0;

            ld3			     	: 	Present_state = ld4;
			ld4			    	: 	Present_state = ld5;
			ld5			    	: 	Present_state = ld6;
			ld6			    	: 	Present_state = ld7;
			ld7				    :  Present_state = fetch0;
			
			ldi3				: 	Present_state = ldi4;
			ldi4				: 	Present_state = ldi5;
			ldi5 				:	Present_state = fetch0;

			mflo3 		     	:	Present_state = fetch0;
			
			mfhi3 		    	:	Present_state = fetch0;

			mul3				: 	Present_state = mul4;
			mul4				: 	Present_state = mul5;
			mul5				: 	Present_state = mul6;
			mul6                :	Present_state = fetch0; 

            neg3				: 	Present_state = neg4;
			neg4				: 	Present_state = fetch0;
			
			not3				: 	Present_state = not4;
			not4				: 	Present_state = fetch0;
			
			or3				    : 	Present_state = or4;
			or4				    : 	Present_state = or5;
			or5			     	:	Present_state = fetch0;

            ori3				: 	Present_state = ori4;
			ori4				: 	Present_state = ori5;
			ori5 				:	Present_state = fetch0;
            			
			out3 				:	Present_state = fetch0;

			rol3				: 	Present_state = rol4;
			rol4				: 	Present_state = rol5;
			rol5 				:	Present_state = fetch0;
			
			ror3				: 	Present_state = ror4;
			ror4				: 	Present_state = ror5;
			ror5 				:	Present_state = fetch0;

		    shl3				: 	Present_state = shl4;
			shl4				: 	Present_state = shl5;
			shl5 				:	Present_state = fetch0;
	
			shr3				: 	Present_state = shr4;
			shr4				: 	Present_state = shr5;
			shr5 				:	Present_state = fetch0;

			st3			     	: 	Present_state = st4;
			st4			    	: 	Present_state = st5;
			st5			    	: 	Present_state = st6;
			st6			    	: 	Present_state = st7;
			st7 				:	Present_state = fetch0;

            sub3				: 	Present_state = sub4;
			sub4				: 	Present_state = sub5;
			sub5				:	Present_state = fetch0;

			nop3                :  Present_state = fetch0;
		
			endcase
	end

    always @(Present_state)
        begin
            case(Present_state)
                Reset_state: begin 
                    Run <= 1;
                    Rin <= 0;
                    //Reset <=1;
                    Clear <= 1;
                    Gra <= 0; 
					Grb <= 0; 
					Grc <= 0; 
					Yin <= 0;	
                    PCout<= 0; 
					Zhighout<=0; 
					Zlowout<=0; 
					MDRout<=0; 
					MARin<=0; 
					PCin<=0; 
					MDRin<=0; 
					IRin<=0; 
					Yin<=0; 
					IncPC<=0;
					read<=0;
               HIin<=0; 
					LOin<=0; 
					HIout<=0; 
					LOout<=0; 
					Zhighin<=0; 
					Zlowin<=0; 
					Cout<=0; 
					wren<=0; 
               Rin<=0; 
					Rout<=0; 
					BAout<=0; 
					conInput<=0;
					conOut <=0;	
					outPortEnable<=0; 
					InPortout<=0;
               end
		
				fetch0: begin
					#10 PCout <= 1; MARin <= 1; IncPC <= 1; Zlowin <= 1;
					#15 PCout <= 0; MARin <= 0; IncPC <= 0; Zlowin <= 0;
				end
				fetch1: begin
					#10 Zlowout <= 1; PCin <= 1; read <= 1; MDRin <= 1;
					#15 Zlowout <= 0; PCin <= 0; read <= 0; MDRin <= 0;
				end
				fetch2: begin
					#10 MDRout <= 1; IRin <= 1;
					#15 MDRout <= 0; IRin <= 0;
				end
				//All basic ALU with grb, grc, steps
				and3, or3, add3, sub3, shl3, shr3, rol3, ror3, div3, mul3, andi3, ori3: begin
					#10 Grb <= 1; Rout <= 1; Yin <= 1;
					#15 Grb <= 1; Rout <= 1; Yin <= 1;
				end
				// mul and div require seperate stuff
				ror4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 9; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				rol4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 8; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				shr4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 7; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				shl4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 6; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				//skip and not
				sub4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 3; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				add4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 2; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				or4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 1; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				and4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 0; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zlowin <= 0;
				end
				and5, or5, add5, sub5, shl5, shr5, rol5, ror5, andi5, ori5 : begin
					#10 Zlowout <= 1; Gra <= 1; Rin <= 1;
					#15 Zlowout <= 0; Gra <= 0; Rin <= 0;
				end
				//mul and div
				mul4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 10; Zhighin <= 1; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zhighin <= 0; Zlowin <= 0;
				end
				div4: begin
					#10 Grc <= 1; Rout <= 1; ctrl <= 11; Zhighin <= 1; Zlowin <= 1;
					#15 Grc <= 0; Rout <= 0; Zhighin <= 0; Zlowin <= 0;
				end
				mul5, div5: begin
					#10 Zlowout<=1; LOin <= 1;
					#15 Zlowout<=0; LOin <= 0;
				end
				mul6, div6: begin
					#10 Zhighout<= 1; HIin <= 1;
					#15 Zhighout<= 0; HIin <= 0;
				end
				//neg and not
				not3: begin
					#10 Grb <= 1; Rout <= 1;  ctrl <= 5; Zlowin <= 1;
					#15 Grb <= 0; Rout <= 0;  Zlowin <= 0;
				end
				neg3: begin
					#10 Grb <= 1; Rout <= 1;  ctrl <= 4; Zlowin <= 1;
					#15 Grb <= 0; Rout <= 0;  Zlowin <= 0;
				end
				not4, neg4 : begin
					#10 Zlowout <= 1; Gra <= 1; Rin <= 1;
					#15 Zlowout <= 0; Gra <= 0; Rin <= 0;
				end
				// andi ori
				andi4: begin
					#10 Cout <= 1; Rout <= 1; ctrl <= 0; Zlowin <= 1;
					#15 Cout <= 0; Rout <= 0; Zlowin <= 0;
				end
				ori4: begin
					#10 Cout <= 1; Rout <= 1; ctrl <= 1; Zlowin <= 1;
					#15 Cout <= 0; Rout <= 0; Zlowin <= 0;
				end
				ld3: begin
					#10 Grb <= 1; Yin <= 1; BAout <= 1;
					#15 Grb <= 0; Yin <= 0; BAout <= 0;
				end
				ld4: begin
					#10 Cout <= 1; ctrl <= 2; Zlowin <= 1;
					#15 Cout <= 0; Zlowin <= 0;
				end
				ld5: begin
					#10 Zlowout <= 1; MARin <= 1;
					#15 Zlowout <= 0; MARin <= 0;
				end
				ld6: begin
					#10 read <= 1; MDRin <= 1;
					#15 read <= 0; MDRin <= 0;
				end
				ld7: begin
					#10 MDRout <= 1; Gra <= 1; Rin <= 1;
					#15 MDRout <= 0; Gra <= 0; Rin <= 0;
				end
				jr3: begin
					#10 Gra <= 1; Rout <= 1; PCin <= 1;
					#15 Gra <= 0; Rout <= 0; PCin <= 0;
				end
				ldi3: begin
					#10 Grb <= 1; BAout <= 1; Yin <= 1;
					#15 Grb <= 0; BAout <= 0; Yin <= 0;
				end
				ldi4: begin
					#10 Cout <= 1; ctrl <= 2; Zlowin <= 1;
					#15 Cout <= 0; Zlowin <= 0;
				end
				ldi5: begin
					#10 Zlowout <= 1; Gra <= 1; Rin <= 1;
					#15 Zlowout <= 0; Gra <= 0; Rin <= 0;
				end
				mflo3: begin
					#10 Gra <= 1; Rin <= 1;  LOout <= 1;
					#15 Gra <= 0; Rin <= 0;  LOout <= 0;
				end
				mfhi3: begin
					#10 Gra <= 1; Rin <= 1;  HIout <= 1;
					#15 Gra <= 0; Rin <= 0;  HIout <= 0;
				end
				out3: begin
					#10 Gra <= 1; Rout <= 1;  outPortEnable <= 1;
					#15 Gra <= 0; Rout <= 0;  outPortEnable <= 0;
				end
				in3: begin
					#10 Gra <= 1; Rin <= 1;  InPortout <= 1;
					#15 Gra <= 0; Rin <= 0;  InPortout <= 0;
				end
				br3: begin
					#10 Gra <= 1; Rout <= 1;  conInput <= 1;
					#15 Gra <= 0; Rout <= 0;  conInput <= 0;
				end
				br4: begin
					#10 PCout <= 1; Yin <= 1;
					#15 PCout <= 0; Yin <= 0;
				end
				br5: begin
					#10 Cout <= 1; ctrl <= 2; Zlowin <= 1;
					#15 Cout <= 0; Zlowin <= 0;
				end
				br6: begin
					#10 Zlowout <= 1;
					if (conOut) begin
					PCin <= 1;
					end
					#15 Zlowout <= 0; PCin <= 1;
				end
				st3: begin
						#10 Grb <= 1; BAout <= 1;Yin <= 1;
						#15 Grb <= 0; BAout <= 0;Yin <= 0;
				end

				st4: begin
						#10 Cout <=1; Zhighin <= 1;  Zlowin <= 1;
						#15 Cout <=1; Zhighin <= 1;  Zlowin <= 1;
				end

				st5: begin
						#10 Zlowin <= 1;MARin<=1;
						#15 Zlowin <= 1;MARin<=1;
				end
				st6: begin
					   #10 read <= 0; Gra <= 1; Rout <= 1; MDRin <= 1;
						#15 read <= 0; Gra <= 1; Rout <= 1; MDRin <= 1;

				end
				st7: begin
					#10 MDRout <= 1; wren <= 1;  
					#15 MDRout <= 1; wren <= 1; 	
				end
				nop3: begin
					end
				halt3: begin
					Run <= 0;
					end
				default: begin
					end
            endcase
        end
endmodule