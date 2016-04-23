#!/bin/bash

# https://cloud.google.com/compute/docs/load-balancing/http/cross-region-example#shut_off_https_access_from_everywhere_but_the_load_balancing_service


# First, add a rule that permits traffic from the load balancing service.
gcloud compute firewall-rules create allow-130-211-0-0-22 \
       --source-ranges 130.211.0.0/22 \
       --target-tags http-tag \
       --allow tcp:80
gcloud compute firewall-rules create allow-130-211-0-0-22 \
       --source-ranges 130.211.0.0/22 \
       --target-tags https-tag \
       --allow tcp:443

# Then, remove the rule that allows HTTP(S) traffic from other sources.
gcloud compute firewall-rules delete www-firewall

# Lastly, test that the load balancer can reach the instances, but that other sources can't.