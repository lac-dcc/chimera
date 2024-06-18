// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module ROM_top
#(
	parameter RAMLENGTH=800, //количество строк памяти ФреймБуфера
	RAM_DATAWIDTH=6, //ширина строки памяти ФБ
	RESOLUTION_H = 1280,
	RESOLUTION_V = 960,
	V_BOTTOM = 1, //vga-тайминги. Типа нематериальные дополнительные пиксели по вертикали и по горизонтали.
   V_SYNC   = 3, //берутся из интернета
   V_TOP    = 30,
	H_FRONT  =  80, 
   H_SYNC   =  136,
   H_BACK   =  216,
	X_WIRE_WIDTH = $clog2 (RESOLUTION_H+H_FRONT+H_SYNC+H_BACK), //логарифм по основанию 2 с округлением в большую сторону. 
	//Считает минимальное количество битов для двоичной кодировки координат без потерь.
	Y_WIRE_WIDTH = $clog2 (RESOLUTION_V+V_BOTTOM+V_SYNC+V_TOP),
	ROM_LENGTH = RAMLENGTH*RAM_DATAWIDTH, //4800. По умолчанию считается,что соотношение сторон экрана будет 4:3. 
	//Так что это обьем картинки разрешением 80*60.
	CNT_WIDTH = $clog2 (ROM_LENGTH)
)
(
  input clk,rst, fifofull, enable, display_on,
  output reg [X_WIRE_WIDTH-1:0]hpos,
  output reg [Y_WIRE_WIDTH-1:0]vpos,
  output reg [2:0]RGB,
  output reg ROMready
);
	reg [CNT_WIDTH-1:0] counter;

	reg [X_WIRE_WIDTH-1:0]hposROM[0:ROM_LENGTH-1]; //массив длинной 4800 и шириной X_WIRE_WIDTH-1. Хранит координату X.
	
	reg [Y_WIRE_WIDTH-1:0]vposROM[0:ROM_LENGTH-1]; //Хранит координату Y.
	
	reg [2:0]RGBROM[0:ROM_LENGTH-1]; //Хранит цвет пикселя, расположенного в точке (X,Y)
	
	initial begin
	$readmemh("hex_hposes.txt",hposROM); //копирование данных из файла hex_hposes.txt в память в виде шестнадцатеричных чисел. 
	//В процессе, компилятор сам переводит их в двоичные. Делается до синтеза.
	$readmemh("hex_vposes.txt", vposROM);
	//$readmemh("hex_RGB_ALLRed.txt", RGBROM);
	//$readmemh("hex_RGB_ALLGreen.txt", RGBROM);
	//$readmemh("hex_RGB_ALLBlue.txt", RGBROM);
	//$readmemh("hex_RGB_ALLWhite.txt", RGBROM);
	//$readmemh("hex_RGB_Checkmates.txt", RGBROM);
	//$readmemh("hex_RGB_TestPicture1.txt", RGBROM);
	//$readmemh("hex_RGB_TestPicture2.txt", RGBROM);
	//$readmemh("hex_RGB_TestPicture3.txt", RGBROM);
	$readmemh("hex_RGB_Working.txt", RGBROM);
	end
	
	
	always@(posedge clk)
	if(rst) begin counter<=0;
	ROMready<=0;
	end else if(enable&~fifofull&display_on) begin
	if(counter==ROM_LENGTH) ROMready<=0;
	else begin 
	counter<=counter+1;
	ROMready<=1;
	end
	end
	
	always@(posedge clk)
	if(rst) begin
	hpos<=0;
	vpos<=0;
	RGB<=0;
	end else if (enable&~fifofull&display_on) begin
	hpos<=hposROM[counter];
	vpos<=vposROM[counter];
	RGB<=RGBROM[counter];
	end
	
endmodule