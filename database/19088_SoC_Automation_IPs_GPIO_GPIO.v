// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

module GPIO (
		// Wrapper ports
		output 	wire [15:0] WGPIODIN,
        input 	wire [15:0] WGPIODOUT,
        input 	wire [15:0] WGPIOPU,
        input 	wire [15:0] WGPIOPD,
        input 	wire [15:0] WGPIODIR,		
		// Externals
        input 	wire [15:0] GPIOIN,
        output 	wire [15:0] GPIOOUT,
        output 	wire [15:0] GPIOPU,
        output 	wire [15:0] GPIOPD,
        output 	wire [15:0] GPIOOEN		
);
		assign GPIOOEN 	= WGPIODIR;
		assign GPIOPU 	= WGPIOPU;
		assign GPIOPD 	= WGPIOPD;
		assign GPIOOUT	= WGPIODOUT;
		assign WGPIODIN = GPIOIN;
endmodule