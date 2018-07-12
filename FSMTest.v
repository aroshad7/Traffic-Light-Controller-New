`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:30:28 07/04/2018
// Design Name:   FSM
// Module Name:   C:/Users/Arosha/Desktop/HDL/Traffic_Controller_Project/FSMTest.v
// Project Name:  Traffic_Controller_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSMTest;

	// Inputs
	reg sensor_sync_in;
	reg walkRegister_status;
	reg prg_sync_in;
	reg expired;
	reg clk;
	reg sys_reset;

	// Outputs
	wire walkRegister_reset;
	wire [1:0] interval_address;
	wire start_timer;
	wire [6:0] light_signals;

	// Instantiate the Unit Under Test (UUT)
	FSM test (
		.sensor_sync_in(sensor_sync_in), 
		.walkRegister_status(walkRegister_status), 
		.prg_sync_in(prg_sync_in), 
		.expired(expired), 
		.walkRegister_reset(walkRegister_reset), 
		.interval_address(interval_address), 
		.start_timer(start_timer), 
		.light_signals(light_signals), 
		.clk(clk), 
		.sys_reset(sys_reset)
	);

	initial begin
		forever #10 clk = ~clk;
	end
	
	initial begin
		forever begin
			#80 expired = 1;
			#20 expired = 0;
		end
	end

	initial begin
		// Initialize Inputs
		sensor_sync_in = 0;
		walkRegister_status = 0;
		prg_sync_in = 0;
		expired = 0;
		clk = 0;
		sys_reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
      sys_reset = 0;
		// Add stimulus here
		#250 walkRegister_status = 1;
		#100 walkRegister_status = 0;
		
		#100 sensor_sync_in = 1;
		#100 sensor_sync_in = 0;
		
		#200 sensor_sync_in = 1;
		#100 sensor_sync_in = 0;
		
		#100 prg_sync_in = 1;
		#100 prg_sync_in = 0;
		
		
	end
      
endmodule

