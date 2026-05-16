echo "total_patrons,schedalg,seed,patron,drink,priority,queue_level,seq_no,service_start_time,arrival_time,completion_time,waiting_time,imbibing_time,turnaround_time,enqueue_time,execution_time,response_time" > simulation_results.csv
for patrons in 5
do
    for seed in 1 #{1..2}
    do
        for schedalg in 0
        do
			#args format ARGS="patrons scheduling_algorithm 0 seed"
			#(echo -n "$patrons,$schedalg,$seed," >&2; make --silent run ARGS="$patrons $schedalg 0 $seed") 2>> simulation_results.csv
			make --silent run ARGS="$patrons $schedalg 0 $seed" 2>&1 >/dev/null | sed "s/^/$patrons,$schedalg,$seed,/" >> simulation_results.csv
        done
    done
done #2>> simulation_results.csv
# Outputs the results into simulation_results.csv in the format:
# patron,drink,priority,queue_level,seq_no,service_start_time,arrival_time,completion_time,waiting_time,imbibing_time,turnaround_time,enqueue_time,execution_time,response_time