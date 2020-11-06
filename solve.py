# python3 solver.py p1.pddl p1.pddl.out

# import urllib.request, urllib.parse, json, sys
import requests, sys
import json
import os.path

if len(sys.argv) not in [2,3]:
    print('usage: python <problem file> [<output file>]')
    exit(0)

domain_file = 'hw5_domain.pddl'
problem_file = sys.argv[1]

if os.path.exists(domain_file):
    domain = open('hw5_domain.pddl', 'r').read()
else:
    print('Cannot find domain file', domain_file)
    exit(0)

if not os.path.exists(problem_file):
    print('Cannot find problem file', problem_file)
    exit(0)
    
url = 'http://solver.planning.domains/solve'
data = {'domain': open(domain_file, 'r').read(), \
        'problem': open(problem_file, 'r').read()}

resp = requests.post(url, verify=False, json=data).json()
status = resp['status']
result = resp['result']

out = open(sys.argv[2], 'w') if len(sys.argv) == 3 else sys.stdout

if status == 'ok':
    out.write('\n'.join([act['name'] for act in result['plan']]))
else:
    out.write(status)
    out.write('\n')    
    out.write(json.dumps(result,indent=2))

out.write('\n')
