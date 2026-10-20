# 9Hits Viewer on Railway
# Runs the 9Hits traffic exchange viewer (headless Chromium)
# Requires NINEHITS_KEY env var (32-char hex App token from dash.9hits.com)

FROM 9hitste/appv6

ENV NINEHITS_KEY=""

# Create startup script that uses env var for access key
RUN printf '#!/bin/bash\nset -e\nif [ -z "$NINEHITS_KEY" ]; then\n  echo "ERROR: NINEHITS_KEY env var not set!"\n  exit 1\nfi\necho "Starting 9Hits Viewer..."\nexec /nh.sh --access-key="$NINEHITS_KEY" --note=railway --hide-browser=yes\n' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
