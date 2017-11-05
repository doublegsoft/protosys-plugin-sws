<div class="${style!'col-md-12'}">
    <ul class="${id!'TODO'}">
    </ul>
</div>

<script type="text/x-template" id="template-${id!'TODO'}">
{{#events}}
<li>
    <div class="timeline-time">
        <span class="date">{{date}}</span>
        <span class="time">{{time}}</span>
    </div>
    <div class="timeline-icon">
        <a href="javascript:;"><i class="fa {{icon}}"></i></a>
    </div>
    <div class="timeline-body">
        <div class="timeline-header">{{header}}</div>
        <div class="timeline-content">{{content}}</div>
        <div class="timeline-footer">{{footer}}</div>
    </div>
</li>
{{/events}}
</script>
