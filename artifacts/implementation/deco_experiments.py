import ite
import pandas as pd
import sys

help_text = "Valid arguments are:\n\tdefault\t\t(heuristics and threshold enabled)\n\tonly_threshold\t(only threshold enabled)\n\tnone\t\t(heuristics and threhsold disabled)\n\tall\t\t(all three configurations)"

def start_experiment(config, out_summary):
    results_table = ite.run_experiments(config)
    df = pd.DataFrame.from_dict(results_table)
    df.to_csv(out_summary, index=False, header=True)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Invalid number of arguments")
        print(help_text)
        exit(1)
    else:
        if sys.argv[1] == "all": 
            print("----- Running experiments with heuristics and threshold enabled -----")
            start_experiment('config/heuristics_and_threshold.json', '/home/repro/results/heuristics_and_threshold_default/summary.csv')
            print("----- Running experiments with heuristics disabled and threshold enabled -----")
            start_experiment('config/only_threshold.json', '/home/repro/results/only_threshold/summary.csv')
            print("----- Running experiments with heuristics and threshold disabled  -----")
            start_experiment('config/no_heuristics_no_threshold.json', '/home/repro/results/no_heuristics_no_threshold/summary.csv')
        elif sys.argv[1] == "default":
            print("----- Running experiments with heuristics and threshold enabled -----")
            start_experiment('config/heuristics_and_threshold.json', '/home/repro/results/heuristics_and_threshold_default/summary.csv')
        elif sys.argv[1] == "only_threshold":
            print("----- Running experiments with heuristics disabled and threshold enabled -----")
            start_experiment('config/only_threshold.json', '/home/repro/results/only_threshold/summary.csv')
        elif sys.argv[1] == "none":
            print("----- Running experiments with heuristics and threshold disabled  -----")
            start_experiment('config/no_heuristics_no_threshold.json', '/home/repro/results/no_heuristics_no_threshold/summary.csv')
        else:
            print("Unknown configuration.")
            print(help_text)
            exit(1)
