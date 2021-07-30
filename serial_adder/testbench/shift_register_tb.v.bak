`timescale 1ns/1ns

module blink_modified_tb;
	// Inputs
	reg t_clk = 1'b0;

	// Outputs
	wire [2:0] t_led;
	
	// Instantiate the Unit Under Test (UUT)
	blink_modified UUT (
		.i_clk(t_clk),
		.o_led(t_led)
	);
	
	always #1 t_clk <= ~t_clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(1, blink_modified_tb);
		
		#1000
		
		$stop;
	end

endmodule