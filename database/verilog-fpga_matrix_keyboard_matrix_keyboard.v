// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230226

module MatrixKeyboard(
	input Clock,
	input Reset,
	input SwitchCathode,
	input [3:0] Rows,
	input [7:0] Cathodes,
	output reg KeyStrobe,
	output reg KeyPressed,
	output reg [4:0] KeyCode
);
	
	// Zmienne pomocnicze
	reg [ 4:0] KeyCounter;
	reg [31:0] KeyBuffer;
	
	// Maszyna stanów
	reg [2:0] State;
	localparam [2:0] WAIT    = 3'b001;
	localparam [2:0] READ    = 3'b010;
	localparam [2:0] ANALYZE = 3'b100;
	
	/*reg [1:0] State;
	localparam [1:0] WAIT    = 2'd0;
	localparam [1:0] READ    = 2'd1;
	localparam [1:0] ANALYZE = 2'd2; */
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			State 		<= WAIT;
			KeyCounter 	<= 0;
			KeyPressed 	<= 0;
			KeyCode 	<= 0;
			KeyBuffer 	<= 0;
		end else begin
			case(State)
				
				// Stan oczekiwania na zmianê katody
				WAIT: begin
					if(SwitchCathode)
						State <= READ;
				end
				
				// Odczytywanie wejœæ Rows i kopiowanie ich stanu
				// do ró¿nych miejsc bufora w zale¿noœci od tego,
				// która katoda jest aktywna
				READ: begin
					if(Cathodes[0]) KeyBuffer[ 3: 0]	<= Rows[3:0];
					if(Cathodes[1]) KeyBuffer[ 7: 4]	<= Rows[3:0];
					if(Cathodes[2]) KeyBuffer[11: 8]	<= Rows[3:0];
					if(Cathodes[3]) KeyBuffer[15:12]	<= Rows[3:0];
					if(Cathodes[4]) KeyBuffer[19:16]	<= Rows[3:0];
					if(Cathodes[5]) KeyBuffer[23:20]	<= Rows[3:0];
					if(Cathodes[6]) KeyBuffer[27:24]	<= Rows[3:0];
					if(Cathodes[7]) KeyBuffer[31:28]	<= Rows[3:0];
					KeyCounter 	<= 0;
					State 		<= ANALYZE;
				end
				
				// Testowanie wszystkich bitów bufora od zerowego do ostatniego
				// W momencie napotkania 1 w buforze, wtedy kopiujemy stan
				// licznika do wyjœcia KeyCode i ustawiamy KeyPressed na 1.
				ANALYZE: begin
					if(KeyBuffer[KeyCounter]) begin
						KeyCode		<= KeyCounter;
						KeyPressed	<= 1'b1;
						State		<= WAIT;
					end else if(&KeyCounter && !KeyBuffer[31]) begin
						KeyPressed	<= 1'b0;
						State		<= WAIT;
					end else begin
						KeyCounter 	<= KeyCounter + 1'b1;
					end
				end
				
				// Tylko w przypadku b³êdu - zresetuj wszystkie rejestry
				default: begin
					State 		<= WAIT;
				end
			endcase
		end
	end
	
	// Wykrywanie zbocza rosn¹cego na KeyPressed
	reg KeyPressedPrevious;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			KeyStrobe <= 1'b0;
			KeyPressedPrevious <= 1'b0;
		end else begin
			KeyPressedPrevious <= KeyPressed;
			if(!KeyPressedPrevious && KeyPressed)
				KeyStrobe <= 1'b1;
			else
				KeyStrobe <= 1'b0;
		end
	end
	
endmodule
