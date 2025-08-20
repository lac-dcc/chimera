import json
import argparse

def should_skip_rule(rule_name, productions):
    if 'expr' in rule_name:
        return True
    return any('expr' in k for k in productions)

def change_probabilities(data, compress_power=0.5):
    updated = {}
    for rule_name, productions in data.items():
        if not isinstance(productions, dict):
            updated[rule_name] = productions
            continue

        if should_skip_rule(rule_name, productions):
            updated[rule_name] = productions
            continue

        original_total = sum(productions.values())

        # Apply compression
        compressed = {k: v**compress_power for k, v in productions.items()}
        compressed_total = sum(compressed.values())

        # Scale to original total
        scaled = {
            k: max(1, int(round(v * original_total / compressed_total)))
            for k, v in compressed.items()
        }

        # Fix rounding error
        diff = sum(scaled.values()) - original_total
        if diff != 0:
            sorted_keys = sorted(scaled, key=scaled.get, reverse=(diff > 0))
            for key in sorted_keys:
                if diff == 0:
                    break
                scaled[key] -= 1 if diff > 0 else -1
                diff += -1 if diff > 0 else 1

        updated[rule_name] = scaled

    return updated

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Modify grammar probabilities in a JSON file.")
    parser.add_argument("--input", required=True, help="Input JSON grammar file")
    parser.add_argument("--output", required=True, help="Output JSON grammar file")
    parser.add_argument("--power", type=float, default=0.5, help="Compression power (default: 0.5)")

    args = parser.parse_args()

    with open(args.input, 'r') as f:
        data = json.load(f)

    changed_grammar = change_probabilities(data, compress_power=args.power)

    with open(args.output, 'w') as f:
        json.dump(changed_grammar, f, indent=2)
