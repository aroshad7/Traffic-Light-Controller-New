`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:21:50 07/05/2018
// Design Name:   TrafficController
// Module Name:   C:/Users/Arosha/Desktop/HDL/Traffic_Controller_Project/TrafficControllerTest.v
// Project Name:  Traffic_Controller_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TrafficController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TrafficControllerTest;

	// Inputs
	reg reset;
	reg clk;
	reg sensor;
	reg walkRequest;
	reg reprogram;
	reg [1:0] extTimeSelector;
	reg [3:0] extTimeValue;

	// Outputs
	wire [3:0] tv;
	wire st,ex ,en;
	wire Rm;
	wire Ym;
	wire Gm;
	wire Rs;
	wire Ys;
	wire Gs;
	wire W;

	// Instantiate the Unit Under Test (UUT)
	TrafficController test (
		.reset(reset), 
		.clk(clk), 
		.sensor(sensor), 
		.walkRequest(walkRequest), 
		.reprogram(reprogram), 
		.extTimeSelector(extTimeSelector), 
		.extTimeValue(extTimeValue), 
		.Rm(Rm), 
		.Ym(Ym), 
		.Gm(Gm), 
		.Rs(Rs), 
		.Ys(Ys), 
		.Gs(Gs), 
		.W(W),
		.tv(tv),
		.st(st),
		.ex(ex),
		.en(en)
	);

	initial begin
		forever #10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		sensor = 0;
		walkRequest = 0;
		reprogram = 0;
		extTimeSelector = 0;
		extTimeValue = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		reset = 0;
		
		#2060
		sensor = 1;
		
		#1300
		sensor = 0;
		
		#100 walkRequest = 1;
		#100 walkRequest = 0;
		
		#500;
		extTimeSelector = 0;
		extTimeValue = 4'd4;
		
		#1100 reprogram = 1;
		#20 reprogram = 0;
		
		
		

	end
      
endmodule

