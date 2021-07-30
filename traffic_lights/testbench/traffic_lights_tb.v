`timescale 1ns/1ns

module traffic_lights_tb;
	// Inputs
	reg t_clk = 0;

	// Outputs
	wire [2:0] t_highway_lights;
	wire [2:0] t_country_lights;
	
	// Instantiate the Unit Under Test (UUT)
	traffic_lights UUT (
		.i_clk(t_clk),
		.o_highway_lights(t_highway_lights),
		.o_country_lights(t_country_lights)
	);
	
	always #1 t_clk <= ~t_clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(1, traffic_lights_tb);
		
		// Simulation with this one is not too helpful considering the timescales necesarry
		
		@(t_highway_lights);
		
		#100
		
		$stop;
	end

endmodule