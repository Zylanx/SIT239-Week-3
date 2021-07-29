`timescale 1ns/1ns

module clock_enable_divider_tb;
	// Inputs
	reg t_clk = 1'b0;

	// Outputs
	wire t_o_clk_en_half;
	wire t_o_clk_en_quarter;
	
	// Just defining a constant for the amount of time to wait
	time wait_time = 10*20;

	// Instantiate the Unit Under Test (UUT)
	clock_enable_divider UUT (
		.i_clk(t_clk),
		.o_clk_en_half(t_o_clk_en_half),
		.o_clk_en_quarter(t_o_clk_en_quarter)
	);

	// drive the clock with a period of 20 units
	always #10 t_clk <= ~t_clk;
	
	
	initial
	begin
		$dumpfile("out.vcd");
		$dumpvars(1, clock_enable_divider_tb);
		
		// Wait for 20 clk cycles
		#(wait_time)
		
		$stop;
	end

endmodule