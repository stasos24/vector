package metadata

components: sources: internal_metrics: {
	title: "Internal Metrics"

	description: """
		Exposes Vector's own internal metrics, allowing you to collect, process,
		and route Vector's internal metrics just like other metrics.
		"""

	classes: {
		commonly_used: true
		delivery:      "at_least_once"
		deployment_roles: ["aggregator", "daemon", "sidecar"]
		development:   "beta"
		egress_method: "batch"
		stateful:      false
	}

	features: {
		acknowledgements: false
		collect: {
			checkpoint: enabled: false
			from: service:       services.vector
		}
		multiline: enabled: false
	}

	support: {
		notices: []
		requirements: []
		warnings: []
	}

	installation: {
		platform_name: null
	}

	configuration: {
		namespace: {
			description: "The namespace of the metric."
			common:      false
			required:    false
			type: string: {
				default: "vector"
			}
		}
		scrape_interval_secs: {
			description: "The interval between metric gathering, in seconds."
			common:      true
			required:    false
			type: float: {
				default: 2.0
				unit:    "seconds"
			}
		}
		tags: {
			common:      false
			description: "Metric tag options."
			required:    false

			type: object: {
				examples: []
				options: {
					host_key: {
						category: "Context"
						common:   false
						description: """
							If set, will add a tag using the provided key name with a value of the current the current host.
							"""
						required: false
						type: string: {
							default: null
						}
					}
					pid_key: {
						category: "Context"
						common:   false
						description: """
							If set, will add a tag using the provided key name with a value of the current the current process ID.
							"""
						required: false
						type: string: {
							default: null
						}
					}
				}
			}
		}
	}

	output: metrics: {
		// Default internal metrics tags
		_internal_metrics_tags: {
			pid: {
				description: "The process ID of the Vector instance."
				required:    false
				examples: ["4232"]
			}
			host: {
				description: "The hostname of the system Vector is running on."
				required:    false
				examples: [_values.local_host]
			}
		}

		// Instance-level "process" metrics
		aggregate_events_recorded_total: {
			description:       "The number of events recorded by the aggregate transform."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		aggregate_failed_updates: {
			description:       "The number of failed metric updates, `incremental` adds, encountered by the aggregate transform."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		aggregate_flushes_total: {
			description:       "The number of flushes done by the aggregate transform."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		api_started_total: {
			description:       "The number of times the Vector GraphQL API has been started."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		config_load_errors_total: {
			description:       "The total number of errors loading the Vector configuration."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		connection_errors_total: {
			description:       "The total number of connection errors for this Vector instance."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		connection_established_total: {
			description:       "The total number of times a connection has been established."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		connection_failed_total: {
			description:       "The total number of times a connection has failed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		connection_send_errors_total: {
			description:       "The total number of errors sending data via the connection."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		connection_send_ack_errors_total: {
			description:       "The total number of protocol acknowledgement errors for this Vector instance for source protocols that support acknowledgements."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		connection_shutdown_total: {
			description:       "The total number of times the connection has been shut down."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		quit_total: {
			description:       "The total number of times the Vector instance has quit."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		recover_errors_total: {
			description:       "The total number of errors caused by Vector failing to recover from a failed reload."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		reload_errors_total: {
			description:       "The total number of errors encountered when reloading Vector."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		reloaded_total: {
			description:       "The total number of times the Vector instance has been reloaded."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		started_total: {
			description:       "The total number of times the Vector instance has been started."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		stopped_total: {
			description:       "The total number of times the Vector instance has been stopped."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}

		// Metrics emitted by one or more components
		// Reusable metric definitions
		adaptive_concurrency_averaged_rtt: {
			description:       "The average round-trip time (RTT) for the current window."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		adaptive_concurrency_in_flight: {
			description:       "The number of outbound requests currently awaiting a response."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		adaptive_concurrency_limit: {
			description:       "The concurrency limit that the adaptive concurrency feature has decided on for this current window."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		adaptive_concurrency_observed_rtt: {
			description:       "The observed round-trip time (RTT) for requests."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		checkpoint_write_errors_total: {
			description:       "The total number of errors writing checkpoints. This metric is deprecated in favor of `component_errors_total`."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		checkpoints_total: {
			description:       "The total number of files checkpointed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		checksum_errors_total: {
			description:       "The total number of errors identifying files via checksum."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		collect_completed_total: {
			description:       "The total number of metrics collections completed for this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		collect_duration_seconds: {
			description:       "The duration spent collecting of metrics for this component."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		command_executed_total: {
			description:       "The total number of times a command has been executed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		command_execution_duration_seconds: {
			description:       "The command execution duration in seconds."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _component_tags
		}
		communication_errors_total: {
			description:       "The total number of errors stemming from communication with the Docker daemon."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		connection_read_errors_total: {
			description:       "The total number of errors reading datagram."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				mode: {
					description: ""
					required:    true
					enum: {
						udp: "User Datagram Protocol"
					}
				}
			}
		}
		consumer_offset_updates_failed_total: {
			description:       "The total number of failures to update a Kafka consumer offset."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		container_processed_events_total: {
			description:       "The total number of container events processed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		container_metadata_fetch_errors_total: {
			description:       "The total number of errors encountered when fetching container metadata."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		containers_unwatched_total: {
			description:       "The total number of times Vector stopped watching for container logs."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		containers_watched_total: {
			description:       "The total number of times Vector started watching for container logs."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		decode_errors_total: {
			description:       "The total number of decode errors seen when decoding data in a source component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_format_picker_edge_cases_total: {
			description:       "The total number of edge cases encountered while picking format of the Kubernetes log message."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_docker_format_parse_failures_total: {
			description:       "The total number of failures to parse a message as a JSON object."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_event_annotation_failures_total: {
			description:       "The total number of failures to annotate Vector events with Kubernetes Pod metadata."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_reflector_desyncs_total: {
			description:       "The total number of desyncs for the reflector."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_state_ops_total: {
			description:       "The total number of state operations."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				op_kind: {
					description: "The kind of operation performed."
					required:    false
				}
			}
		}
		k8s_stream_chunks_processed_total: {
			description:       "The total number of chunks processed from the stream of Kubernetes resources."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_stream_processed_bytes_total: {
			description:       "The number of bytes processed from the stream of Kubernetes resources."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_watch_requests_invoked_total: {
			description:       "The total number of watch requests invoked."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_watch_requests_failed_total: {
			description:       "The total number of watch requests failed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_watch_stream_failed_total: {
			description:       "The total number of watch streams failed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_watch_stream_items_obtained_total: {
			description:       "The total number of items obtained from a watch stream."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		k8s_watcher_http_error_total: {
			description:       "The total number of HTTP error responses for the Kubernetes watcher."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		encode_errors_total: {
			description:       "The total number of errors encountered when encoding an event."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		events_discarded_total: {
			description:       "The total number of events discarded by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				reason: _reason
			}
		}
		events_failed_total: {
			description:       "The total number of failures to read a Kafka message."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		events_in_total: {
			description:       """
				The number of events accepted by this component either from tagged
				origins like file and uri, or cumulatively from other origins.
				This metric is deprecated and will be removed in a future version.
				Use [`component_received_events_total`](\(urls.vector_sources)/internal_metrics/#component_received_events_total) instead.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              component_received_events_total.tags
		}
		events_out_total: {
			description:       """
				The total number of events emitted by this component.
				This metric is deprecated and will be removed in a future version.
				Use [`component_sent_events_total`](\(urls.vector_sources)/internal_metrics/#component_sent_events_total) instead.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {output: _output}
		}
		processed_events_total: {
			description:       """
				The total number of events processed by this component.
				This metric is deprecated in place of using
				[`component_received_events_total`](\(urls.vector_sources)/internal_metrics/#component_received_events_total) and
				[`component_sent_events_total`](\(urls.vector_sources)/internal_metrics/#component_sent_events_total) metrics.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_byte_size: {
			description:       "The number of bytes current in the buffer."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_events: {
			description:       "The number of events currently in the buffer."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_discarded_events_total: {
			description:       "The number of events dropped by this non-blocking buffer."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_received_event_bytes_total: {
			description:       "The number of bytes received by this buffer."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_received_events_total: {
			description:       "The number of events received by this buffer."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_sent_event_bytes_total: {
			description:       "The number of bytes sent by this buffer."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		buffer_sent_events_total: {
			description:       "The number of events sent by this buffer."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		component_discarded_events_total: {
			description:       "The number of events dropped by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		component_received_bytes_total: {
			description:       string | *"The number of raw bytes accepted by this component from source origins."
			type:              "counter"
			default_namespace: "vector"
			tags:              component_received_events_total.tags
		}
		component_received_events_total: {
			description: """
				The number of events accepted by this component either from tagged
				origins like file and uri, or cumulatively from other origins.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				file: {
					description: "The file from which the data originated."
					required:    false
				}
				uri: {
					description: "The sanitized URI from which the data originated."
					required:    false
				}
				container_name: {
					description: "The name of the container from which the data originated."
					required:    false
				}
				pod_name: {
					description: "The name of the pod from which the data originated."
					required:    false
				}
				peer_addr: {
					description: "The IP from which the data originated."
					required:    false
				}
				peer_path: {
					description: "The pathname from which the data originated."
					required:    false
				}
				mode: _mode
			}
		}
		component_received_events_count: {
			description: """
				A histogram of Vector the number of events passed in each internal batch in Vector's internal topology.
				Note that this is separate than sink-level batching. It is mostly useful for low level debugging
				performance issues in Vector due to small internal batches.
				"""
			type:              "histogram"
			default_namespace: "vector"
			tags:              _component_tags & {
				file: {
					description: "The file from which the data originated."
					required:    false
				}
				uri: {
					description: "The sanitized URI from which the data originated."
					required:    false
				}
				container_name: {
					description: "The name of the container from which the data originated."
					required:    false
				}
				pod_name: {
					description: "The name of the pod from which the data originated."
					required:    false
				}
				peer_addr: {
					description: "The IP from which the data originated."
					required:    false
				}
				peer_path: {
					description: "The pathname from which the data originated."
					required:    false
				}
				mode: _mode
			}
		}
		component_received_event_bytes_total: {
			description: """
				The number of event bytes accepted by this component either from
				tagged origins like file and uri, or cumulatively from other origins.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              component_received_events_total.tags
		}
		component_sent_bytes_total: {
			description:       "The number of raw bytes sent by this component to destination sinks."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				endpoint: {
					description: "The endpoint to which the bytes were sent. For HTTP, this will be the host and path only, excluding the query string."
					required:    false
				}
				file: {
					description: "The absolute path of the destination file."
					required:    false
				}
				protocol: {
					description: "The protocol used to send the bytes."
					required:    true
				}
				region: {
					description: "The AWS region name to which the bytes were sent. In some configurations, this may be a literal hostname."
					required:    false
				}
			}
		}
		component_sent_events_total: {
			description:       "The total number of events emitted by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {output: _output}
		}
		component_sent_event_bytes_total: {
			description:       "The total number of event bytes emitted by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {output: _output}
		}
		datadog_logs_received_in_total: {
			description:       "Number of Datadog logs received."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		datadog_metrics_received_in_total: {
			description:       "Number of Datadog metrics received."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_queue_messages: {
			description:       "Current number of messages in producer queues."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_queue_messages_bytes: {
			description:       "Current total size of messages in producer queues."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_requests_total: {
			description:       "Total number of requests sent to Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_requests_bytes_total: {
			description:       "Total number of bytes transmitted to Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_responses_total: {
			description:       "Total number of responses received from Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_responses_bytes_total: {
			description:       "Total number of bytes received from Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_produced_messages_total: {
			description:       "Total number of messages transmitted (produced) to Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_produced_messages_bytes_total: {
			description:       "Total number of message bytes (including framing, such as per-Message framing and MessageSet/batch framing) transmitted to Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_consumed_messages_total: {
			description:       "Total number of messages consumed, not including ignored messages (due to offset, etc), from Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		kafka_consumed_messages_bytes_total: {
			description:       "Total number of message bytes (including framing) received from Kafka brokers."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		file_delete_errors_total: {
			description:       "The total number of failures to delete a file. This metric is deprecated in favor of `component_errors_total`."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		file_watch_errors_total: {
			description:       "The total number of errors encountered when watching files. This metric is deprecated in favor of `component_errors_total`."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		files_added_total: {
			description:       "The total number of files Vector has found to watch."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		files_deleted_total: {
			description:       "The total number of files deleted."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		files_resumed_total: {
			description:       "The total number of times Vector has resumed watching a file."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		files_unwatched_total: {
			description:       "The total number of times Vector has stopped watching a file."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		fingerprint_read_errors_total: {
			description:       "The total number of times Vector failed to read a file for fingerprinting. This metric is deprecated in favor of `component_errors_total`."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				file: _file
			}
		}
		glob_errors_total: {
			description:       "The total number of errors encountered when globbing paths. This metric is deprecated in favor of `component_errors_total`."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags & {
				path: _path
			}
		}
		http_bad_requests_total: {
			description:       "The total number of HTTP `400 Bad Request` errors encountered."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		http_client_response_rtt_seconds: {
			description:       "The round-trip time (RTT) of HTTP requests, tagged with the response code."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _component_tags & {
				status: _status
			}
		}
		http_client_responses_total: {
			description:       "The total number of HTTP requests, tagged with the response code."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				status: _status
			}
		}
		http_client_rtt_seconds: {
			description:       "The round-trip time (RTT) of HTTP requests."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _component_tags
		}
		http_error_response_total: {
			description:       "The total number of HTTP error responses for this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		http_request_errors_total: {
			description:       "The total number of HTTP request errors for this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		http_requests_total: {
			description:       "The total number of HTTP requests issued by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		invalid_record_total: {
			description:       "The total number of invalid records that have been discarded."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		invalid_record_bytes_total: {
			description:       "The total number of bytes from invalid records that have been discarded."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		logging_driver_errors_total: {
			description: """
				The total number of logging driver errors encountered caused by not using either
				the `jsonfile` or `journald` driver.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		lua_memory_used_bytes: {
			description:       "The total memory currently being used by the Lua runtime."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		metadata_refresh_failed_total: {
			description:       "The total number of failed efforts to refresh AWS EC2 metadata."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		metadata_refresh_successful_total: {
			description:       "The total number of AWS EC2 metadata refreshes."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		open_connections: {
			description:       "The number of current open connections to Vector."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		parse_errors_total: {
			description:       "The total number of errors parsing metrics for this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		processed_bytes_total: {
			description:       "The number of bytes processed by the component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				file: {
					description: "The file from which the bytes originate."
					required:    false
				}
				uri: {
					description: "The sanitized URI from which the bytes originate."
					required:    false
				}
				container_name: {
					description: "The name of the container from which the bytes originate."
					required:    false
				}
				pod_name: {
					description: "The name of the pod from which the bytes originate."
					required:    false
				}
				peer_addr: {
					description: "The IP from which the bytes originate."
					required:    false
				}
				peer_path: {
					description: "The pathname from which the bytes originate."
					required:    false
				}
				mode: _mode
			}
		}
		component_errors_total: {
			description:       "The total number of errors encountered by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				error_type: _error_type
				stage:      _stage
			}
		}
		processing_errors_total: {
			description:       "The total number of processing errors encountered by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				error_type: _error_type
			}
		}
		protobuf_decode_errors_total: {
			description:       "The total number of [Protocol Buffers](\(urls.protobuf)) errors thrown during communication between Vector instances."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		request_errors_total: {
			description:       "The total number of requests errors for this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		request_duration_seconds: {
			description:       "The total request duration in seconds."
			type:              "histogram"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		request_read_errors_total: {
			description:       "The total number of request read errors for this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		request_automatic_decode_errors_total: {
			description:       "The total number of request errors for this component when it attempted to automatically discover and handle the content-encoding of incoming request data."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		requests_completed_total: {
			description:       "The total number of requests completed by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		requests_received_total: {
			description:       "The total number of requests received by this component."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		send_errors_total: {
			description:       "The total number of errors sending messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		splunk_pending_acks: {
			description:       "The number of outstanding Splunk HEC indexer acknowledgement acks."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		streams_total: {
			description:       "The total number of streams."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_delete_failed_total: {
			description:       "The total number of failures to delete SQS messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_delete_succeeded_total: {
			description:       "The total number of successful deletions of SQS messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_processing_failed_total: {
			description:       "The total number of failures to process SQS messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_processing_succeeded_total: {
			description:       "The total number of SQS messages successfully processed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_receive_failed_total: {
			description:       "The total number of failures to receive SQS messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_receive_succeeded_total: {
			description:       "The total number of times successfully receiving SQS messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_message_received_messages_total: {
			description:       "The total number of received SQS messages."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		sqs_s3_event_record_ignored_total: {
			description:       "The total number of times an S3 record in an SQS message was ignored (for an event that was not `ObjectCreated`)."
			type:              "counter"
			default_namespace: "vector"

			tags: _component_tags & {
				ignore_type: {
					description: "The reason for ignoring the S3 record"
					required:    true
					enum: {
						"invalid_event_kind": "The kind of invalid event."
					}
				}
			}
		}
		stale_events_flushed_total: {
			description:       "The number of stale events that Vector has flushed."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		stdin_reads_failed_total: {
			description:       "The total number of errors reading from stdin."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		tag_value_limit_exceeded_total: {
			description: """
				The total number of events discarded because the tag has been rejected after
				hitting the configured `value_limit`.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		timestamp_parse_errors_total: {
			description:       "The total number of errors encountered parsing [RFC 3339](\(urls.rfc_3339)) timestamps."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}
		uptime_seconds: {
			description:       "The total number of seconds the Vector instance has been up."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		utf8_convert_errors_total: {
			description:       "The total number of errors converting bytes to a UTF-8 string in UDP mode."
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags & {
				mode: {
					description: "The connection mode used by the component."
					required:    true
					enum: {
						udp: "User Datagram Protocol"
					}
				}
			}
		}
		utilization: {
			description:       "A ratio from 0 to 1 of the load on a component. A value of 0 would indicate a completely idle component that is simply waiting for input. A value of 1 would indicate a that is never idle. This value is updated every 5 seconds."
			type:              "gauge"
			default_namespace: "vector"
			tags:              _component_tags
		}
		value_limit_reached_total: {
			description: """
				The total number of times new values for a key have been rejected because the
				value limit has been reached.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _component_tags
		}

		// Windows metrics
		windows_service_does_not_exist_total: {
			description: """
				The total number of errors raised due to the Windows service not
				existing.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		windows_service_install_total: {
			description: """
				The total number of times the Windows service has been installed.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		windows_service_restart_total: {
			description: """
				The total number of times the Windows service has been restarted.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		windows_service_start_total: {
			description: """
				The total number of times the Windows service has been started.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		windows_service_stop_total: {
			description: """
				The total number of times the Windows service has been stopped.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}
		windows_service_uninstall_total: {
			description: """
				The total number of times the Windows service has been uninstalled.
				"""
			type:              "counter"
			default_namespace: "vector"
			tags:              _internal_metrics_tags
		}

		// Helpful tag groupings
		_component_tags: _internal_metrics_tags & {
			component_kind: _component_kind
			component_id:   _component_id
			component_name: _component_name
			component_type: _component_type
		}

		// All available tags
		_collector: {
			description: "Which collector this metric comes from."
			required:    true
		}
		_component_kind: {
			description: "The Vector component kind."
			required:    true
			enum: {
				"sink":      "Vector sink components"
				"source":    "Vector source components"
				"transform": "Vector transform components"
			}
		}
		_component_id: {
			description: "The Vector component ID."
			required:    true
			examples: ["my_source", "my_sink"]
		}
		_component_name: {
			description: "Deprecated, use `component_id` instead. The value is the same as `component_id`."
			required:    true
			examples: ["my_source", "my_sink"]
		}
		_component_type: {
			description: "The Vector component type."
			required:    true
			examples: ["file", "http", "honeycomb", "splunk_hec"]
		}
		_endpoint: {
			description: "The absolute path of originating file."
			required:    true
			examples: ["http://localhost:8080/server-status?auto"]
		}
		_error_type: {
			description: "The type of the error"
			required:    true
			enum: {
				"acknowledgements_failed":     "The acknowledgement operation failed."
				"delete_failed":               "The file deletion failed."
				"encode_failed":               "The encode operation failed."
				"field_missing":               "The event field was missing."
				"glob_failed":                 "The glob pattern match operation failed."
				"http_error":                  "The HTTP request resulted in an error code."
				"invalid_metric":              "The metric was invalid."
				"kafka_offset_update":         "The comsumer offset update failed."
				"kafka_read":                  "The message from Kafka was invalid."
				"mapping_failed":              "The mapping failed."
				"match_failed":                "The match operation failed."
				"out_of_order":                "The event was out of order."
				"parse_failed":                "The parsing operation failed."
				"read_failed":                 "The file read operation failed."
				"render_error":                "The rendering operation failed."
				"stream_closed":               "The downstream was closed, forwarding the event(s) failed."
				"type_conversion_failed":      "The type conversion operating failed."
				"type_field_does_not_exist":   "The type field does not exist."
				"type_ip_address_parse_error": "The IP address did not parse."
				"unlabeled_event":             "The event was not labeled."
				"value_invalid":               "The value was invalid."
				"watch_failed":                "The file watch operation failed."
				"write_failed":                "The file write operation failed."
			}
		}
		_file: {
			description: "The file that produced the error"
			required:    false
		}
		_host: {
			description: "The hostname of the originating system."
			required:    true
			examples: [_values.local_host]
		}
		_mode: {
			description: "The connection mode used by the component."
			required:    false
			enum: {
				udp:  "User Datagram Protocol"
				tcp:  "Transmission Control Protocol"
				unix: "Unix domain socket"
			}
		}
		_output: {
			description: "The specific output of the component."
			required:    false
		}
		_stage: {
			description: "The stage within the component at which the error occurred."
			required:    true
			enum: {
				receiving:  "While receiving data."
				processing: "While processing data within the component."
				sending:    "While sending data."
			}
		}
		_status: {
			description: "The HTTP status code of the request."
			required:    false
		}
		_path: {
			description: "The path that produced the error."
			required:    true
		}
		_reason: {
			description: "The type of the error"
			required:    true
			enum: {
				"out_of_order": "The event was out of order."
				"oversized":    "The event was too large."
			}
		}
	}

	how_it_works: {
		unique_series: {
			title: "Sending metrics from multiple Vector instances"
			body: """
				When sending `internal_metrics` from multiple Vector instances
				to the same destination, you will typically want to tag the
				metrics with a tag that is unique to the Vector instance sending
				the metrics to avoid the metric series conflicting. The
				`tags.host_key` option can be used for this, but you can also
				use a subsequent `remap` transform to add a different unique
				tag from the environment.
				"""
		}
	}

	telemetry: metrics: {
		component_discarded_events_total:     components.sources.internal_metrics.output.metrics.component_discarded_events_total
		component_errors_total:               components.sources.internal_metrics.output.metrics.component_errors_total
		component_received_events_total:      components.sources.internal_metrics.output.metrics.component_received_events_total
		component_received_event_bytes_total: components.sources.internal_metrics.output.metrics.component_received_event_bytes_total
	}
}
