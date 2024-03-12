module ALU_tb();

	// //-- Registro para generar la señal de reloj
	// reg clk = 0;
	// //-- Generador de reloj. Periodo 2 unidades
	// always #1 clk = ~clk;

    reg         [2:0] aluCtl = 0;
    reg  signed [7:0] inR = 0;
    reg  signed [7:0] inM = 0;
    wire signed [7:0] aluOut;
    wire              flag;

    ALU alu0 (
    /*  in */  .aluCtl( aluCtl ),
    /*  in */  .inR( inR ),
    /*  in */  .inM( inM ),
    /* out */  .aluOut( aluOut ),
    /* out */  .flag( flag )
    );

    reg [2:0] count;

	//-- Proceso al inicio
	initial begin

		//-- Fichero donde almacenar los resultados
		$dumpfile("ALU_tb.vcd");
		$dumpvars(0, ALU_tb);

        #1;
        inR = -3;
        inM = 5;
        for ( count = 2'b0; count<4; count=count+1 ) begin
            #1 aluCtl[1:0] = count ;
        end

        #1 inR = 0;
           aluCtl[2] = 0;
        #1 aluCtl[2] = 1;

        #1 inR = -3;
           aluCtl[2] = 0;
        #1 aluCtl[2] = 1;
        #1;

	end

endmodule
