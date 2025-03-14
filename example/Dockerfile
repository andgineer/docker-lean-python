FROM andgineer/lean-python

COPY requirements.txt requirements.txt
RUN uv pip install -r requirements.txt

COPY ping.py ping.py

# Lean python base set python as ENTRYPOINT, so we need only module name in the CMD
CMD ["ping.py"]
