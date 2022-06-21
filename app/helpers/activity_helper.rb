module ActivityHelper
  def activities_pane(in_progress_qty, upcoming_qty, completed_qty)
    {
      id: 'activities_pane_id',
      options: [
        {
          heading: in_progress_qty,
          sub_heading: 'activities.statuses.in_progress'
        },
        {
          heading: upcoming_qty,
          sub_heading: 'activities.statuses.upcoming'
        },
        {
          heading: completed_qty,
          sub_heading: 'activities.statuses.completed'
        }
      ]
    }
  end
end