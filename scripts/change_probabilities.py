import json

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

with open('mixed_jasper_chibench_grammar.json', 'r') as f:
    data = json.load(f)

changed_grammar = change_probabilities(data)

with open('mixed_jasper_chibench_grammar_boosted.json', 'w') as f:
    json.dump(changed_grammar, f, indent=2)
